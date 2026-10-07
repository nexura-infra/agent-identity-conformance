# Agent Identity Conformance Initial Structure Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create the local, documentation- and fixture-first skeleton for the
future `nexura/agent-identity-conformance` repository.

**Architecture:** The initial repository stores project scope, research
destinations, language-neutral fixtures, and deterministic structural
validation. It intentionally has no runtime implementation, sandbox, or
cloud/Kubernetes configuration; those follow only after evidence-led research.

**Tech Stack:** Markdown, JSON/YAML-ready directories, POSIX shell, Git.

**Spec:** `/Users/adamkozak/make/herness-testing/docs/superpowers/specs/2026-10-07-initial-project-structure.md`

## Global Constraints

- Work only in `/Users/adamkozak/make/herness-testing`.
- Do not create a remote repository, GitHub issue, PR, or upstream contact.
- Intended eventual remote is `nexura/agent-identity-conformance`, never a
  personal `Kouzi99` repository.
- Do not add private keys, certificates, bearer tokens, credentials, or `.env`
  data.
- Do not create a Go module, agent runtime, Ollama configuration, SPIRE/Dapr
  manifest, or Kubernetes resource.
- Preserve the supplied brief as scope, not as a research conclusion.

## Review Focus

- A starter document must not present an unverified claim as a fact.
- `.gitignore` must exclude secrets and local agent/tool state without hiding
  source fixtures or documents.
- The fixture directories must remain language-neutral and contain no runtime
  implementation.
- Structural validation must fail if a required file or directory is absent.
- GitHub setup must remain deferred while organization authentication is
  unavailable.

---

### Task 1: Establish the repository boundary and documentation layout

**Files:**

- Create: `/Users/adamkozak/make/herness-testing/README.md`
- Create: `/Users/adamkozak/make/herness-testing/PROJECT_BRIEF.md`
- Create: `/Users/adamkozak/make/herness-testing/docs/research/README.md`
- Create: `/Users/adamkozak/make/herness-testing/docs/architecture/README.md`
- Create: `/Users/adamkozak/make/herness-testing/docs/matrices/README.md`
- Create: `/Users/adamkozak/make/herness-testing/docs/decisions/README.md`

**Interfaces:**

- Consumes: approved structure specification and the supplied investigation
  brief.
- Produces: clearly scoped Markdown documents; later research writes only to
  the named documentation areas.

- [ ] **Step 1: Write the failing structure assertion**

```sh
test -f README.md && test -f PROJECT_BRIEF.md && test -f docs/research/README.md
```

- [ ] **Step 2: Run the assertion before creating the files**

Run: `cd /Users/adamkozak/make/herness-testing && test -f README.md && test -f PROJECT_BRIEF.md && test -f docs/research/README.md`

Expected: non-zero exit because the starter documents do not exist.

- [ ] **Step 3: Write scope-only starter documents**

`README.md` states the problem boundary and explicitly separates facts,
inference, and proposed design. `PROJECT_BRIEF.md` contains the supplied
prompt verbatim. Each documentation-area README states its expected evidence
and forbids unlinked conclusions.

- [ ] **Step 4: Re-run the assertion**

Run: `cd /Users/adamkozak/make/herness-testing && test -f README.md && test -f PROJECT_BRIEF.md && test -f docs/research/README.md`

Expected: exit 0.

### Task 2: Add neutral fixtures, contracts, and safety defaults

**Files:**

- Create: `/Users/adamkozak/make/herness-testing/fixtures/v1/README.md`
- Create: `/Users/adamkozak/make/herness-testing/contracts/README.md`
- Create: `/Users/adamkozak/make/herness-testing/.gitignore`
- Create: `/Users/adamkozak/make/herness-testing/.github/workflows/README.md`

**Interfaces:**

- Consumes: project boundary from Task 1.
- Produces: versioned locations for language-neutral test cases and future CI
  documentation, with no assumed runtime or provider.

- [ ] **Step 1: Write the failing fixture-boundary assertion**

```sh
test -f fixtures/v1/README.md && test -f contracts/README.md && test -f .gitignore
```

- [ ] **Step 2: Run the assertion before creating the files**

Run: `cd /Users/adamkozak/make/herness-testing && test -f fixtures/v1/README.md && test -f contracts/README.md && test -f .gitignore`

Expected: non-zero exit because the fixture and safety files do not exist.

- [ ] **Step 3: Write the neutral fixture and contract boundary**

The fixture README defines declarative inputs, expected allow/deny outcomes,
and evidence requirements without choosing Go, Kubernetes, SPIRE, Dapr, or
Ollama. The contracts README reserves normalized request, identity, decision,
and audit-result representations. `.gitignore` excludes `.env`, credential
material, editor state, and local tool state while retaining all source
fixtures.

- [ ] **Step 4: Re-run the assertion**

Run: `cd /Users/adamkozak/make/herness-testing && test -f fixtures/v1/README.md && test -f contracts/README.md && test -f .gitignore`

Expected: exit 0.

### Task 3: Add deterministic layout verification and local Git initialization

**Files:**

- Create: `/Users/adamkozak/make/herness-testing/scripts/verify-layout.sh`
- Create: `/Users/adamkozak/make/herness-testing/.github/workflows/README.md`
- Modify: `/Users/adamkozak/make/herness-testing/README.md`

**Interfaces:**

- Consumes: all required directories and documents from Tasks 1–2.
- Produces: `scripts/verify-layout.sh`, which exits non-zero for a missing
  required path or tracked secret-shaped filename, and exit 0 for the approved
  skeleton.

- [ ] **Step 1: Write the failing shell test for an absent verifier**

```sh
test -x scripts/verify-layout.sh
```

- [ ] **Step 2: Run it before implementation**

Run: `cd /Users/adamkozak/make/herness-testing && test -x scripts/verify-layout.sh`

Expected: non-zero exit because the verifier does not exist.

- [ ] **Step 3: Implement the minimal verifier**

The script must enumerate the required paths, report each missing path to
standard error, and reject tracked files matching `.env`, `*.pem`, `*.key`,
or `*.p12`. It must not inspect credentials or run network commands.

- [ ] **Step 4: Verify the skeleton and initialize only local Git metadata**

Run:

```sh
cd /Users/adamkozak/make/herness-testing
scripts/verify-layout.sh
git init
git remote -v
```

Expected: verifier exits 0; Git is initialized locally; `git remote -v`
prints no remote, preserving the deferred `nexura` decision.

## Self-Review

- Spec coverage: Task 1 creates the documented research boundary; Task 2
  creates neutral fixture locations and secret-safe defaults; Task 3 adds
  deterministic verification and local-only Git setup.
- Placeholder scan: the plan names every file, command, and required behavior.
- Interface consistency: all tasks use the exact root directory and reserve
  `scripts/verify-layout.sh` as the only validation interface.
- Review focus: each concern is covered by starter-document wording,
  `.gitignore`, or verifier behavior; remote GitHub creation remains excluded.
