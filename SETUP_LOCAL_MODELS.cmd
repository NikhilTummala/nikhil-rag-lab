@echo off
setlocal
where ollama >nul 2>nul
if errorlevel 1 (
  echo Install and start Ollama from https://ollama.com/download/windows first.
  pause
  exit /b 1
)
echo Downloading local models. This needs internet and free disk space.
ollama pull llama3.2:1b
if errorlevel 1 (
  echo Llama download failed. Start Ollama and check your internet connection.
  pause
  exit /b 1
)
ollama pull nomic-embed-text
if errorlevel 1 (
  echo Embedding model download failed. See the error above.
  pause
  exit /b 1
)
echo Models ready. Use START_LOCAL_LLM.cmd after SETUP_WINDOWS.cmd.
pause
