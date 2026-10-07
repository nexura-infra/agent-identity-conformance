# Agent Identity Conformance

An evidence-based conformance project for portable AI-agent configuration,
identity, delegation, and MCP authorization across local development, CI,
generic workloads, and Kubernetes.

## Boundary

This repository starts by investigating existing standards and projects. It
does not introduce a new protocol, runtime, or identity bridge. No claim in
this repository is a fact until it is source-linked in `docs/research/`.

- **Facts** are directly supported by a primary source and dated.
- **Inferences** explain implications of verified facts.
- **Proposals** are optional designs, clearly labeled as such.

The first milestone is language-neutral fixtures and a conformance boundary,
not a deployment system. It must not contain credentials, private keys,
certificates, or bearer tokens.

## Layout

- `PROJECT_BRIEF.md` — approved investigation scope.
- `docs/` — research, architecture, matrices, and decisions.
- `fixtures/v1/` — language-neutral conformance scenarios.
- `contracts/` — normalized future test inputs and results.
- `scripts/verify-layout.sh` — deterministic structural validation.

## Status

The intended remote is `nexura/agent-identity-conformance`. It has not been
created yet: GitHub organization authentication must be repaired first.

Run the local structural check:

```sh
scripts/verify-layout.sh
```
