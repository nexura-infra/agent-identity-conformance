# Project Brief

You are my senior platform and security engineering partner. Help me investigate and build a small, evidence-based project around portable AI-agent configuration and identity across different execution environments.

## Goal

Determine what already exists, where the real interoperability gaps are, and produce a small, testable prototype that could become a useful upstream contribution.

The project must work across environments in principle: local developer machines, CI runners, ordinary processes or containers, and Kubernetes. Kubernetes and Dapr are examples to evaluate, not assumptions.

Do not start by inventing a new universal protocol or bridge. First establish whether an existing standard or project already covers the need.

## My intended use case

A local Codex or Claude Code process may act as the orchestrator, using a cloud model while retaining access to the project. It may delegate a narrowly scoped task through MCP to a local Ollama model. The local model must receive only the explicit task payload and must not gain filesystem, shell, or unrestricted network access.

I also want to understand how workload identity, SPIFFE/SPIRE, MCP authorization, and enterprise policy could fit into the same design without tying it to Kubernetes.

## Work in this order

### 1. Inspect before changing anything

- Inspect the current repository, instructions, git status, and existing work.
- Do not overwrite or reformat unrelated files or discard uncommitted changes.
- If this repository is unrelated to the project, do read-only reconnaissance and recommend the right place to work.
- Do not contact maintainers, publish anything, or create external issues or pull requests.

### 2. Research the current state

Use current, primary sources where possible. Check the relevant specifications, official documentation, repositories, issues, and contribution instructions for:

- Harness Protocol and `harness-kit`
- MCP authorization
- SPIFFE and SPIRE
- WIMSE and the IETF AIMS work
- Dapr, including its Sentry identity issuer and its MCP integration paths
- CI workload identity options, such as GitHub or GitLab OIDC, if relevant

For every important claim, provide a direct source link and the source’s current status. Distinguish facts, inference, and proposed design. Do not claim that a solution does not exist merely because a search did not find it.

Explicitly verify whether Dapr’s default SPIFFE identities come from Dapr Sentry or SPIRE. Do not treat those as interchangeable.

### 3. Separate the security questions

Analyze these separately; do not collapse them into one “agent identity”:

1. Profile and plugin provenance: who supplied the configuration or code?
2. Human identity: who initiated the task?
3. Agent or workload identity: which running process is calling?
4. Delegation: is the agent acting on behalf of a user, and what authority was delegated?
5. Tool authorization: may this caller invoke this MCP tool with this request?
6. Runtime enforcement, revocation, and audit: where are decisions actually enforced and recorded?

Treat Harness permissions as declared intent unless the implementation demonstrably enforces them. Never put private keys, certificates, or bearer credentials in `harness.yaml`.

### 4. Build a cross-environment comparison

At minimum, compare:

- Local developer process using Codex or Claude Code, MCP, and Ollama
- A CI runner
- A generic service or container
- Kubernetes with SPIRE and/or Dapr

For each, record how identity is obtained, how MCP calls are authorized, what identity the server sees, how delegation is represented, and what prevents a compromised agent from bypassing policy.

Do not assume a desktop process can obtain a SPIFFE identity safely. Verify the platform and attestation mechanism.

### 5. Propose and implement a narrow first milestone

The likely direction is a conformance test project, not a new runtime:

- Keep test fixtures and expected behavior language-neutral.
- Prefer Go for a small test runner or reference adapter if it adds value.
- Fit tests into an existing upstream project where practical instead of duplicating its implementation.
- Start with one executable vertical slice. Do not attempt to support every environment at once.
- Test behavior, not nondeterministic LLM responses.

Candidate checks include: unauthorized callers are rejected; token audience and expiry are checked; user and agent identities are not confused; denied calls never reach the tool; secrets do not appear in logs; and unsupported identity requirements fail clearly rather than silently falling back.

For the local Ollama pilot, enforce isolation outside the prompt: the worker must not receive filesystem or shell access, and its network access must be explicitly constrained. Document exactly what the MCP boundary does and does not protect.

If the evidence shows that the best first contribution is documentation or fixtures rather than code, do that and explain why. Do not add Harness Protocol fields or propose a new standard until the cross-environment tests demonstrate a real gap and you have checked alignment with current IETF work.

## Deliverables

Create reviewable files in the current project only if its purpose fits:

1. A concise README explaining the problem and project boundary.
2. A source-linked research and status summary.
3. A cross-environment capability and gap matrix.
4. A small architecture diagram and threat boundaries.
5. A language-neutral initial test fixture set.
6. A minimal Go runner or adapter only if useful and supported by the research.
7. Tests and exact commands used to verify the result.
8. A short recommendation for a concrete upstream contribution.

Work autonomously on reversible local changes. Do not stop after presenting a plan: complete the useful first milestone. If a decision is genuinely blocked, continue independent research and clearly state the blocker and the smallest decision needed from me.
