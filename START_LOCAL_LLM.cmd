@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Please run SETUP_WINDOWS.cmd first.
  pause
  exit /b 1
)
set "NIKHIL_RAG_MODE=ollama"
set "NIKHIL_RAG_MODEL=llama3.2:1b"
set "NIKHIL_NEURAL=1"
set "NIKHIL_EMBED_MODEL=nomic-embed-text:latest"
echo Keep Ollama running. Close any previous Jupyter server before this one.
".venv\Scripts\python.exe" -m jupyterlab
if errorlevel 1 pause
