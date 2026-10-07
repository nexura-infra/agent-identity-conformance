# v1 Conformance Fixtures

Fixtures are declarative and language-neutral. A case will describe its
explicit task payload, caller identity context, requested tool action,
expected allow or deny decision, expected tool-observation result, and
required audit evidence. Fixtures must test deterministic authorization and
isolation behavior, never an LLM's prose quality.

This directory does not choose an implementation language, model provider,
orchestrator, container runtime, Kubernetes, SPIRE, Dapr, or Ollama setup.
