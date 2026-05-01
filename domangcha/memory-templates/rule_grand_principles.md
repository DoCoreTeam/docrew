---
name: Grand Principles (Karpathy)
description: Karpathy 4 coding grand principles applied to DOMANGCHA — Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution
type: feedback
---

## Grand Principles — Applied to All Code Writing

These 4 principles apply to CEO, all DC-* agents, and direct edits. Bias toward caution over speed.

### 1. Think Before Coding
**Don't assume. Don't hide confusion. Surface tradeoffs.**
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- *DOMANGCHA:* During INTENT PARSE, if scope is ambiguous, list interpretations before entering the pipeline.

### 2. Simplicity First
**Minimum code that solves the problem. Nothing speculative.**
- No features beyond what was asked. No abstractions for single-use code.
- No error handling for impossible scenarios.
- *DOMANGCHA:* Don't add speculative GATE checks or over-engineer agent prompts.

### 3. Surgical Changes
**Touch only what you must. Clean up only your own mess.**
- Don't "improve" adjacent code, comments, or formatting not related to the task.
- Match existing style, even if you'd do it differently.
- *DOMANGCHA:* When updating an agent file, don't reorganize unrelated sections.

### 4. Goal-Driven Execution
**Define success criteria. Loop until verified.**
- Transform every task into a verifiable goal before executing.
- *DOMANGCHA:* Don't mark complete without running GATE 1-5.

**Why:** Reduces unnecessary diff changes, rewrites from over-engineering, and ambiguity-driven mistakes.
**How to apply:** Before any code change, check: Am I assuming? Is this the minimum? Am I touching only what's needed? Do I have a verifiable success criterion?
