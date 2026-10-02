# Attribution and adaptation record

This personal edition was prepared for Nikhil Tummala with AI assistance from the ten notebooks he supplied. The core code and small educational corpus in this edition were rewritten for a local, transparent workflow; supplying a name does not change the origin of the research ideas.

The supplied notebooks use the headings **RAG From Scratch**, **Self RAG**, **LangGraph Retrieval Agent**, **Adaptive RAG**, **Corrective RAG**, and **Local RAG agent with LLaMA3**. They reference LangChain/LangGraph examples, Lilian Weng's articles, and RAG research papers. Their reference URLs are retained in each corresponding new notebook. No license file was supplied with the attachments, so this bundle does not assert a license grant over the originals or linked material. It does not bundle copies of the original notebooks or linked articles.

Key concepts and their sources include:

- LangChain RAG from scratch: https://github.com/langchain-ai/rag-from-scratch
- LangGraph examples and workflows: https://github.com/langchain-ai/langgraph
- Lilian Weng, LLM-powered autonomous agents: https://lilianweng.github.io/posts/2023-06-23-agent/
- Self-RAG: https://arxiv.org/abs/2310.11511
- Corrective RAG: https://arxiv.org/abs/2401.15884
- Adaptive-RAG: https://arxiv.org/abs/2403.14403
- HyDE: https://arxiv.org/abs/2212.10496
- RAPTOR: https://arxiv.org/abs/2401.18059
- Ollama APIs: https://docs.ollama.com/api

The attached originals' SHA-256 hashes and filenames are recorded in `original_source_manifest.json` to identify the source edition without redistributing it. This file is provenance, not evidence of original authorship or execution.

## New edition's contributions

- A consistent data-engineering assistant and a small inspectable educational corpus.
- Self-contained notebooks with explicit demo versus local-LLM labeling.
- Standard-library TF-IDF and BM25, RRF, MMR, parent retrieval, and SQLite persistence.
- Validated JSON actions and bounded retrieval/reflection/correction controllers.
- Source identifiers, explicit abstention, per-run traces, and calculated smoke-test metrics.
- Optional local neural embeddings with a content/model-digest cache.
- Windows setup/launch scripts and straightforward run instructions.

No employer-specific results, confidential company data, invented benchmark improvements, or original-research claims are included. External models and software retain their own licenses.
