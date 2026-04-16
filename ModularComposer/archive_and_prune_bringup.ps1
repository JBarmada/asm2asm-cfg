param(
    [string]$ArchiveRoot = "D:\ModularComposer-Archives",
    [switch]$KeepSource
)

$ErrorActionPreference = "Stop"

$workspaceRoot = "C:\Users\creat\Desktop\learning\ASMwork\ModularComposer"
$resultsRoot = Join-Path $workspaceRoot "results\composer\geminiComposer"
$zstdExe = "C:\Users\creat\miniconda3\Library\bin\zstd.exe"
$tarExe = (Get-Command tar -ErrorAction Stop).Source
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logPath = Join-Path $workspaceRoot "archive_and_prune_bringup_$stamp.log"

$targets = @(
    (Join-Path $resultsRoot "qwen0.5b\bringup"),
    (Join-Path $resultsRoot "qwen1.5b\bringup"),
    (Join-Path $resultsRoot "qwen3b\bringup")
)

function Write-Log {
    param([string]$Message)
    $line = "[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message
    Write-Host $line
    Add-Content -LiteralPath $logPath -Value $line
}

function Assert-UnderRoot {
    param(
        [string]$Path,
        [string]$Root
    )
    $resolvedPath = [System.IO.Path]::GetFullPath($Path)
    $resolvedRoot = [System.IO.Path]::GetFullPath($Root)
    if (-not $resolvedPath.StartsWith($resolvedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to operate outside root '$resolvedRoot': $resolvedPath"
    }
    return $resolvedPath
}

if (-not (Test-Path -LiteralPath $zstdExe)) {
    throw "Missing zstd executable: $zstdExe"
}

New-Item -ItemType Directory -Force -Path $ArchiveRoot | Out-Null
Write-Log "Archive root: $ArchiveRoot"
Write-Log "Keep source after archive: $KeepSource"

foreach ($target in $targets) {
    if (-not (Test-Path -LiteralPath $target)) {
        Write-Log "Skipping missing path: $target"
        continue
    }

    $resolvedTarget = Assert-UnderRoot -Path $target -Root $resultsRoot
    $targetItem = Get-Item -LiteralPath $resolvedTarget
    $parentDir = $targetItem.Parent.FullName
    $relativeParent = $parentDir.Substring($resultsRoot.Length).TrimStart('\')
    $archiveName = ($relativeParent -replace '[\\/]+', '__') + "__" + $targetItem.Name + ".tar.zst"
    $archivePath = Join-Path $ArchiveRoot $archiveName

    Write-Log "Archiving: $resolvedTarget"
    Write-Log "Archive file: $archivePath"

    if (Test-Path -LiteralPath $archivePath) {
        throw "Archive already exists, refusing to overwrite: $archivePath"
    }

    & $tarExe --force-local -cf - -C $parentDir $targetItem.Name |
        & $zstdExe -T0 -19 -o $archivePath
    if ($LASTEXITCODE -ne 0) {
        throw "Archive creation failed for $resolvedTarget"
    }

    Write-Log "Verifying compressed stream integrity: $archivePath"
    & $zstdExe -t $archivePath
    if ($LASTEXITCODE -ne 0) {
        throw "zstd integrity check failed for $archivePath"
    }

    Write-Log "Verifying tar listing: $archivePath"
    & $zstdExe -d -c $archivePath | & $tarExe --force-local -tf - > $null
    if ($LASTEXITCODE -ne 0) {
        throw "tar listing verification failed for $archivePath"
    }

    $archiveBytes = (Get-Item -LiteralPath $archivePath).Length
    Write-Log ("Archive size: {0:N2} GB" -f ($archiveBytes / 1GB))

    if (-not $KeepSource) {
        Write-Log "Removing source tree: $resolvedTarget"
        Remove-Item -LiteralPath $resolvedTarget -Recurse -Force
    }
}

Write-Log "Completed archive/prune run."
