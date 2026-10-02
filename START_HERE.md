# Nikhil RAG Lab
## Data Engineering Knowledge Assistant
Personal project edition prepared for **Nikhil Tummala**.

## What to do on your Windows laptop

1. Extract the entire ZIP to a folder such as `Documents\Nikhil_RAG_Lab`. Do not run it from inside the ZIP viewer.
2. Install Python 3.11 or 3.12 from https://www.python.org/downloads/windows/ if needed. Include the Python launcher (`py`).
3. Double-click `SETUP_WINDOWS.cmd` once. It creates a project-only Python environment and installs JupyterLab. Internet is needed for this installation.
4. Double-click `START_DEMO.cmd`. JupyterLab opens in your browser. If it prints a local URL instead, open that URL.
5. Open `01_Introduction_To_RAG.ipynb` and choose **Run → Run All Cells**. Then work through 02–10. Each notebook also runs independently.

**Demo mode works without an API key, an LLM, a GPU, or model downloads.** It uses real TF-IDF/BM25 retrieval and actual Python control flow, but answers are extracted sentences and agent decisions are rules. It is not full LLM RAG. Each notebook prints its mode. Existing displayed outputs are validated demo runs from the build environment; rerunning replaces them with your results.

## Run the real local LLM version

1. Install and start Ollama: https://ollama.com/download/windows
2. Double-click `SETUP_LOCAL_MODELS.cmd` once. It downloads `llama3.2:1b` and `nomic-embed-text`. Internet and disk space are needed. The model licenses apply to your use of those models.
3. Close your demo Jupyter server, then double-click `START_LOCAL_LLM.cmd` and run the notebooks. Closing the browser tab alone does not stop a Jupyter server; use Ctrl+C in its terminal.

The local launcher requires the Llama model and enables neural embeddings in notebook 10. Notebooks 01–09 retain lightweight sparse retrieval while using the LLM for generation and applicable agent decisions. Notebook 10 adds dense neural retrieval. If a model is unavailable, local mode fails with instructions rather than quietly displaying a demo.

Your laptop's available memory and CPU determine speed. The smaller Llama 3.2 1B default is chosen to reduce resource use; it is not the original Llama 3 8B model. Model quality may be limited. Close other memory-heavy applications if necessary. Models are unloaded after each call, reducing persistent memory usage but adding latency.

## Alternative: use your existing Jupyter or VS Code installation

Open any notebook with a Python 3.11+ kernel and run all cells. Its core requires only Python's standard library. It embeds sample documents, so it still works if downloaded separately. `MODE='auto'` uses the chosen local model if installed; otherwise it explicitly prints DEMO. To force a mode, edit the `MODE` line in the first code cell to `'demo'` or `'ollama'` and rerun all cells.

To enable notebook 10's dense embeddings without the launcher, change its `ENABLE_NEURAL` line to `True`, ensure `nomic-embed-text:latest` is installed, and use local LLM mode. Other notebooks do not depend on notebook 10.

## Notebook map

| Notebook | Main behavior |
|---|---|
| 01 | Chunk, index, retrieve, answer with sources |
| 02 | Multi-query, RRF, decomposition, step-back, hypothetical-text retrieval |
| 03 | Category routing and validated metadata queries |
| 04 | Parent retrieval, summaries, SQLite vector persistence |
| 05 | TF-IDF, BM25, hybrid retrieval, reranking, MMR, measured retrieval metrics |
| 06 | Relevance grading, answer checks, bounded rewrites, abstention |
| 07 | Allowlisted search tools and a bounded retrieval agent |
| 08 | Adaptive routing between primary, supplemental, direct, and abstain paths |
| 09 | Corrective retrieval from a secondary local collection |
| 10 | Local Llama, optional neural embeddings, cached vectors, reflective retrieval |

## Your data and results

- `data/documents.json`: the main educational corpus. It is not employer or university data.
- `data/supplemental_documents.json`: a separate local evidence source for corrective and adaptive workflows; it is **not live web search**.
- Add documents using unique `id` values and nonempty `title`, `category`, and `text` strings. Use `engineering`, `rag`, or `evaluation` categories for the routing examples.
- `results/`: answers, traces, computed metrics, and a SQLite index. Reruns overwrite the corresponding example results; save a copy if you want to compare runs.
- Built-in test questions reference the bundled corpus. Update labels and category descriptions if you replace it.
- `VALIDATION.json`: which code cells were executed during preparation and which integrations remain untested.

## Differences from the supplied notebooks

This is a rewritten local learning project, not merely renamed copies. It replaces the old LangChain/LangGraph/cloud integrations with standard-library Python and direct Ollama calls. The main workflows are still present, but the local Python controller is not LangGraph. TF-IDF is not a learned embedding model. Keyword overlap is not a semantic judge. The demo hypothetical-text example is not full neural HyDE. Cohere reranking is replaced with an explicitly lexical reranker. Paid web-search calls are replaced with a local supplemental collection. Full RAPTOR and ColBERT implementations are not included; their role and original references are documented in notebook 04.

The notebook titles and project context are personalized. The RAG methods and supplied source materials remain credited in `ATTRIBUTION.md`.

## Validation and limitations

Every code cell in all 10 notebooks was executed sequentially in demo mode in a separate namespace per notebook. Syntax and notebook JSON were checked, retrieval metrics were calculated, SQLite reload was verified, and bounded/abstention paths ran. This was Python-cell execution, not a Jupyter kernel launch. The Windows `.cmd` files, package installation, live Ollama inference, and neural model downloads were not executable in the build environment and remain untested. The optional API integration follows the official Ollama documentation.

A small example corpus and hand-authored labels do not demonstrate production accuracy. No model-training, research novelty, or measured speedup is claimed. Use the actual results from your own runs when describing the project.

## Troubleshooting

- **`py` is not recognized:** repair/install Python and enable its launcher, then reopen the terminal.
- **Jupyter is missing:** run `SETUP_WINDOWS.cmd` and check its final success message.
- **Model unavailable:** start Ollama, run `ollama list`, and rerun `SETUP_LOCAL_MODELS.cmd` if needed.
- **Wrong mode:** close the old Jupyter server, launch the intended `.cmd`, and restart the kernel. Or explicitly edit `MODE` in the notebook.
- **Timeout or slow inference:** use the demo launcher, close other applications, or raise the `local_api` timeout in the notebook. Small-model responses may still be inaccurate.
- **Invalid model JSON:** restart the kernel and retry or select another locally installed model. Invalid actions are deliberately rejected.
- **Changed dataset breaks examples:** restore the bundled files or update the explicit test questions/labels.
- **Notebook opens as text:** use JupyterLab or VS Code's Jupyter notebook editor.

## API references

- https://docs.ollama.com/api/chat
- https://docs.ollama.com/api/embed
- https://docs.ollama.com/api/tags
- https://ollama.com/library/llama3.2
- https://ollama.com/library/nomic-embed-text
