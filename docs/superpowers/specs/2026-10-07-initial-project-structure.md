# Agent Identity Conformance — Initial Project Structure

## Purpose

Create a reviewable local foundation for an evidence-led project about portable
AI-agent configuration, workload identity, delegation, and MCP authorization.
The foundation is intentionally documentation- and fixture-first; it does not
claim a new protocol, install an agent runtime, or implement a sandbox.

## Repository identity

- Intended GitHub repository: `nexura/agent-identity-conformance`.
- Current local staging directory: `/Users/adamkozak/make/herness-testing`.
- Remote creation is deferred until a GitHub account with write access to the
  `nexura` organization is authenticated. No project will be created under
  the personal `Kouzi99` account.

## Initial layout

```text
README.md
PROJECT_BRIEF.md
docs/
  research/
  architecture/
  matrices/
  decisions/
  superpowers/specs/
fixtures/v1/
contracts/
scripts/
.github/workflows/
.gitignore
```

## Responsibilities

- `README.md`: project boundary, local usage, and the distinction between
  verified facts, inferences, and proposals.
- `PROJECT_BRIEF.md`: the supplied investigation brief, preserved as project
  scope rather than treated as an implementation result.
- `docs/research`: source-linked status research.
- `docs/architecture`: threat boundaries and a small architecture diagram.
- `docs/matrices`: the four-environment comparison.
- `docs/decisions`: evidence-backed decisions and rejected assumptions.
- `fixtures/v1`: language-neutral conformance cases and expected outcomes.
- `contracts`: stable representations of inputs and results for future test
  runners.
- `scripts`: deterministic local validation only; no privileged automation.
- `.github/workflows`: future CI validation for fixtures and documents.

## Explicit exclusions from the first structure

- No Go module or runner before research identifies a specific executable
  conformance gap.
- No Kubernetes, Dapr, SPIRE, or Ollama runtime configuration.
- No private keys, certificates, bearer tokens, or credentials.
- No GitHub remote, issue, PR, or upstream contact.

## Acceptance checks

- The local structure contains only the directories and starter documents
  above.
- The brief states that all security conclusions require source-backed
  research.
- The repository is ready to be initialized with remote
  `nexura/agent-identity-conformance` once authentication is repaired.
