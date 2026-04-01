# Bash cmds

## build docker from dockerfile

```bash
docker build -t my-crosscompile .
```

Make a .docker.env files with
'''text
GOOGLE_API_KEY=Your API key
'''

## Run docker

```bash
docker run --rm -it --env-file .docker.env -v "${PWD}:/datasets" my-crosscompile bash
```

## Example command

```bash
python3 GeminiComposer.py ../results/exp01_import_from_adpretko --source-language arm --model gemini-3-flash-preview --prompt-config base
```
