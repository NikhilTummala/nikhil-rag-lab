@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Please run SETUP_WINDOWS.cmd first.
  pause
  exit /b 1
)
set "NIKHIL_RAG_MODE=demo"
set "NIKHIL_NEURAL=0"
".venv\Scripts\python.exe" -m jupyterlab
if errorlevel 1 pause
