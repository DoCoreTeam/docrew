# DOCORE ADK — Agent Development Kit for Claude Code

> 16 AI Agents. One command. Full development pipeline.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-ADK-blue)](https://claude.ai/code)

## What is DOCORE?

DOCORE is an **Agent Development Kit (ADK)** for [Claude Code](https://claude.ai/code) that turns Claude into a **CEO orchestrator** managing 16 specialized AI agents — from business planning to deployment.

One command triggers the full pipeline:

```bash
/ceo "Build a SaaS todo app with authentication and payments"
```

## Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/DoCoreTeam/docore/main/docore/install.sh | bash
```

Then open any project in Claude Code and run `/ceo-init`.

## How It Works

```
/ceo "task"
     │
     ▼
① PLANNER ──── DC-BIZ (business) + DC-RES (research) + DC-OSS (libraries)
     │
     ▼
② GENERATOR ── DC-DEV-FE + DC-DEV-BE + DC-DEV-DB + DC-DEV-MOB
     │          DC-DEV-OPS + DC-DEV-INT + DC-WRT + DC-DOC + DC-SEO
     │            (parallel development)
     ▼
③ EVALUATOR ── DC-QA (tests) + DC-SEC (security) + DC-REV (review)
     │            (FAIL → back to ② max 3 retries)
     ▼
④ GATE 1-5 ── pattern scan + completion check + version tag + role separation + diff check
     │
     ▼
⑤ REPORT ──── code + tests + docs + git commit v0.x.0
```

## 16 Agents

| Phase | Agent | Role | Model |
|-------|-------|------|-------|
| PLANNER | DC-BIZ | Business Judge | Opus |
| PLANNER | DC-RES | Researcher | Haiku |
| PLANNER | DC-OSS | Open Source Scout | Opus |
| GENERATOR | DC-DEV-FE | Frontend Developer | Sonnet |
| GENERATOR | DC-DEV-BE | Backend Developer | Sonnet |
| GENERATOR | DC-DEV-DB | Database Engineer | Sonnet |
| GENERATOR | DC-DEV-MOB | Mobile Developer | Sonnet |
| GENERATOR | DC-DEV-OPS | DevOps Engineer | Sonnet |
| GENERATOR | DC-DEV-INT | Integration Engineer | Sonnet |
| GENERATOR | DC-WRT | Writer / Copywriter | Sonnet |
| GENERATOR | DC-DOC | Documentation Writer | Haiku |
| GENERATOR | DC-SEO | SEO / AEO / GEO Specialist | Haiku |
| EVALUATOR | DC-QA | QA Engineer | Haiku |
| EVALUATOR | DC-SEC | Security Reviewer | Opus |
| EVALUATOR | DC-REV | Code Reviewer | Opus |
| SUPPORT | DC-TOK | Token Optimizer | Haiku |

## Commands

| Command | What it does |
|---------|-------------|
| `/ceo "task"` | Run full pipeline with all 16 agents |
| `/ceo-init` | Initialize project (registries + harness) |
| `/ceo-status` | Show current project status |

## Repository Structure

```
docore/                          ← Install this directory to ~/.claude/skills/docore
├── CLAUDE.md                    ← Auto-loaded by Claude Code (entry point)
├── install.sh                   ← Installer script
├── agents/                      ← 16 agent definitions
│   ├── dc-biz.md
│   ├── dc-dev-be.md
│   └── ... (16 total)
├── commands/                    ← Slash command definitions
│   ├── ceo.md
│   ├── ceo-init.md
│   └── ceo-status.md
├── skills/ceo-system/           ← CEO orchestration brain
│   └── SKILL.md
└── templates/                   ← Registry templates (copied to ~/.claude/)
    ├── error-registry.md
    ├── skill-registry.md
    ├── project-registry.md
    └── decision-log.md
```

## Quality Gates

Every output passes 5 gates before delivery:

| Gate | Check |
|------|-------|
| GATE 1 | Error registry pattern scan (known bad patterns blocked) |
| GATE 2 | Completion criteria verification |
| GATE 3 | Version tag `v0.0.0` present |
| GATE 4 | Builder ≠ Reviewer (role separation enforced) |
| GATE 5 | Breaking change detection |

## Security Built-in

- OWASP Top 10 review on every sprint
- JWT httpOnly cookies only (no localStorage)
- AES-256-GCM for PII encryption
- Rate limiting on all endpoints
- Input validation with Zod
- RLS (Row Level Security) enforcement

## Manual Install

```bash
git clone https://github.com/DoCoreTeam/docore.git /tmp/docore
cp -r /tmp/docore/docore ~/.claude/skills/docore
```

After install, open Claude Code in any project and run `/ceo-init` to initialize.

## Requirements

- [Claude Code](https://claude.ai/code) CLI
- Anthropic API key with access to Claude Opus, Sonnet, and Haiku models

## License

MIT — see [LICENSE](LICENSE)

## Author

Built by **Docore** / DoCoreTeam
