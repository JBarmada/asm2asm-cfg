param(
    [string]$SourceRoot = "C:\Users\creat\Desktop\learning\ASMwork\ModularComposer\results\composer",
    [string]$ShareRoot = "C:\Users\creat\Desktop\learning\ASMwork\share\results_for_collab",
    [string]$ZipPath = "C:\Users\creat\Desktop\learning\ASMwork\share\results_for_collab.zip",
    [switch]$IncludeCleanDiagnostics
)

$ErrorActionPreference = "Stop"

function Get-RelativePath {
    param(
        [string]$BasePath,
        [string]$TargetPath
    )

    $baseUri = [System.Uri]((Resolve-Path $BasePath).Path.TrimEnd('\') + '\')
    $targetUri = [System.Uri](Resolve-Path $TargetPath).Path
    $relativeUri = $baseUri.MakeRelativeUri($targetUri)
    return [System.Uri]::UnescapeDataString($relativeUri.ToString()).Replace('/', '\')
}

function Copy-DirectoryPreserveLayout {
    param(
        [string]$Root,
        [System.IO.DirectoryInfo]$Directory,
        [string]$DestinationRoot
    )

    $relativePath = Get-RelativePath -BasePath $Root -TargetPath $Directory.FullName
    $destination = Join-Path $DestinationRoot $relativePath
    $destinationParent = Split-Path -Parent $destination
    New-Item -ItemType Directory -Path $destinationParent -Force | Out-Null
    Copy-Item -LiteralPath $Directory.FullName -Destination $destinationParent -Recurse -Force
}

function Copy-FilePreserveLayout {
    param(
        [string]$Root,
        [System.IO.FileInfo]$File,
        [string]$DestinationRoot
    )

    $relativePath = Get-RelativePath -BasePath $Root -TargetPath $File.FullName
    $destination = Join-Path $DestinationRoot $relativePath
    $destinationDir = Split-Path -Parent $destination
    New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null
    Copy-Item -LiteralPath $File.FullName -Destination $destination -Force
}

function Measure-Directory {
    param([string]$Path)

    $files = Get-ChildItem -LiteralPath $Path -Recurse -File -ErrorAction SilentlyContinue
    return [PSCustomObject]@{
        Files = ($files | Measure-Object).Count
        Bytes = ($files | Measure-Object -Property Length -Sum).Sum
    }
}

if (-not (Test-Path -LiteralPath $SourceRoot)) {
    throw "Source root does not exist: $SourceRoot"
}

$shareParent = Split-Path -Parent $ShareRoot
$zipParent = Split-Path -Parent $ZipPath
New-Item -ItemType Directory -Path $shareParent -Force | Out-Null
New-Item -ItemType Directory -Path $zipParent -Force | Out-Null

if (Test-Path -LiteralPath $ShareRoot) {
    Remove-Item -LiteralPath $ShareRoot -Recurse -Force
}
if (Test-Path -LiteralPath $ZipPath) {
    Remove-Item -LiteralPath $ZipPath -Force
}

New-Item -ItemType Directory -Path $ShareRoot -Force | Out-Null

$directoryPatterns = @("txts", "validation_json", "fixed_*_asm")
if ($IncludeCleanDiagnostics) {
    $directoryPatterns += "clean_diagnostics"
}

$copiedDirectories = New-Object System.Collections.Generic.List[string]
$copiedFiles = New-Object System.Collections.Generic.List[string]

foreach ($pattern in $directoryPatterns) {
    Get-ChildItem -LiteralPath $SourceRoot -Recurse -Directory -Filter $pattern | ForEach-Object {
        Copy-DirectoryPreserveLayout -Root $SourceRoot -Directory $_ -DestinationRoot $ShareRoot
        $copiedDirectories.Add($_.FullName) | Out-Null
    }
}

Get-ChildItem -LiteralPath $SourceRoot -Recurse -File -Filter "checkpoint_*.json" | Where-Object {
    $_.Directory.Name -eq "logs"
} | ForEach-Object {
    Copy-FilePreserveLayout -Root $SourceRoot -File $_ -DestinationRoot $ShareRoot
    $copiedFiles.Add($_.FullName) | Out-Null
}

$shareMetrics = Measure-Directory -Path $ShareRoot

$finalValidationJsons = Get-ChildItem -LiteralPath $ShareRoot -Recurse -File -Filter "final_error_problems.json" -ErrorAction SilentlyContinue
$fixedAsmDirs = Get-ChildItem -LiteralPath $ShareRoot -Recurse -Directory -Filter "fixed_*_asm" -ErrorAction SilentlyContinue
$reportFiles = Get-ChildItem -LiteralPath $ShareRoot -Recurse -File -Include "*.txt" -ErrorAction SilentlyContinue | Where-Object {
    $_.Directory.Name -eq "txts"
}

$manifestPath = Join-Path $ShareRoot "PACKAGE_INFO.txt"
$manifestLines = @(
    "Packaged at: $(Get-Date -Format s)",
    "Source root: $SourceRoot",
    "Share root: $ShareRoot",
    "Included directories: txts, validation_json, fixed_*_asm" + $(if ($IncludeCleanDiagnostics) { ", clean_diagnostics" } else { "" }),
    "Included files: logs\\checkpoint_*.json",
    "Excluded: compile_probe, raw_model_output, cleaned_model_output, prompts",
    "Copied directory count: $($copiedDirectories.Count)",
    "Copied checkpoint file count: $($copiedFiles.Count)",
    "Packaged file count: $($shareMetrics.Files)",
    "Packaged size (GB): $([Math]::Round(($shareMetrics.Bytes / 1GB), 2))",
    "Report file count: $($reportFiles.Count)",
    "final_error_problems.json count: $($finalValidationJsons.Count)",
    "fixed_*_asm directory count: $($fixedAsmDirs.Count)"
)
Set-Content -LiteralPath $manifestPath -Value $manifestLines -Encoding UTF8

Compress-Archive -LiteralPath $ShareRoot -DestinationPath $ZipPath -CompressionLevel Optimal -Force

$zipFile = Get-Item -LiteralPath $ZipPath
$zip = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
try {
    $zipEntries = $zip.Entries.Count
}
finally {
    $zip.Dispose()
}

[PSCustomObject]@{
    ShareRoot = $ShareRoot
    ZipPath = $ZipPath
    ShareFiles = $shareMetrics.Files
    ShareSizeGB = [Math]::Round(($shareMetrics.Bytes / 1GB), 2)
    ZipSizeGB = [Math]::Round(($zipFile.Length / 1GB), 2)
    ReportFiles = $reportFiles.Count
    FinalValidationJsons = $finalValidationJsons.Count
    FixedAsmDirs = $fixedAsmDirs.Count
    ZipEntries = $zipEntries
} | Format-List
