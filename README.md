# DOCORE ADK — Agent Development Kit for Claude Code

> **EN** — 16 AI Agents. One command. Full development pipeline.
>
> **KO** — 16개 AI 에이전트. 명령 하나. 완전한 개발 파이프라인.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-ADK-blue)](https://claude.ai/code)

---

## What is DOCORE? / DOCORE란?

**EN** — DOCORE is an **Agent Development Kit (ADK)** for [Claude Code](https://claude.ai/code) that turns Claude into a **CEO orchestrator** managing 16 specialized AI agents — from business planning to deployment. Before executing any task, CEO always asks clarifying questions first (tech stack, platform, completion criteria, constraints). No blind execution.

**KO** — DOCORE는 [Claude Code](https://claude.ai/code)용 **에이전트 개발 키트(ADK)**입니다. Claude를 **CEO 오케스트레이터**로 전환하여 기획부터 배포까지 16개의 전문 AI 에이전트를 관리합니다. 모든 업무 실행 전 CEO가 먼저 핵심 질문을 합니다 (기술스택, 플랫폼, 완료 기준, 제약사항). 묻지도 않고 실행하지 않습니다.

```bash
/ceo "Build a SaaS todo app with authentication and payments"
/ceo "인증과 결제 기능이 있는 SaaS 투두앱 만들어줘"
```

---

## Quick Install / 빠른 설치

```bash
curl -sSL https://raw.githubusercontent.com/DoCoreTeam/docore/main/docore/install.sh | bash
```

**EN** — The installer automatically sets up everything in one shot:
1. 16 DOCORE agents → `~/.claude/agents/`
2. `/ceo`, `/ceo-init`, `/ceo-status` + 10 CEO-* orchestrators → `~/.claude/commands/`
3. CEO skill → `~/.claude/skills/ceo-system/`
4. `~/.claude/CLAUDE.md` (auto-loaded on every Claude Code session)
5. **ECC (Everything Claude Code)** — 183 skills + 79 commands → `~/.claude/skills/` + `~/.claude/commands/`
6. **gstack** — Garry Tan's 23-tool setup → `~/.claude/skills/gstack/`
7. **Superpowers** — installed via `claude plugin` or GitHub fallback

**KO** — 설치 스크립트가 한 번에 모든 것을 자동 설치합니다:
1. DOCORE 에이전트 16개 → `~/.claude/agents/`
2. `/ceo`, `/ceo-init`, `/ceo-status` + CEO-* 오케스트레이터 10개 → `~/.claude/commands/`
3. CEO 스킬 → `~/.claude/skills/ceo-system/`
4. `~/.claude/CLAUDE.md` (Claude Code 세션마다 자동 로드)
5. **ECC (Everything Claude Code)** — 스킬 183개 + 커맨드 79개 자동 설치
6. **gstack** — Garry Tan의 23개 도구 → `~/.claude/skills/gstack/`
7. **Superpowers** — `claude plugin`으로 설치 시도, 불가 시 GitHub fallback

**EN** — Re-running the installer always updates everything to the latest version (registries are preserved).

**KO** — 재설치 시 모든 것이 최신 버전으로 업데이트됩니다 (레지스트리는 보존).

---

## How It Works / 작동 방식

```
/ceo "task"
     │
     ▼
⓪ Q&A ──── CEO asks 3~7 clarifying questions before any work
     │       CEO가 3~7개 질문 후 답변 받으면 진행
     │       (tech stack / platform / done criteria / constraints)
     │       (기술스택 / 플랫폼 / 완료기준 / 제약)
     │
     ▼
① PLANNER ── DC-BIZ + DC-RES + DC-OSS → PLAN.md
     │
     ▼
② GENERATOR (parallel / 병렬)
     │  DC-DEV-FE + DC-DEV-BE + DC-DEV-DB + DC-DEV-MOB
     │  DC-DEV-OPS + DC-DEV-INT + DC-WRT + DC-DOC + DC-SEO
     │
     ▼  ┌─────────────────────────────────────────┐
③ CYCLE │  IMPLEMENT → CODE REVIEW → TEST          │
     │  │      └─ bug found → FIX → REVIEW → TEST │  max 3x / 최대 3회
     │  │      └─ pass → next                      │
     │  └─────────────────────────────────────────┘
     │
     ▼
④ GATE 1-5
     │  GATE 1: error patterns + 300-line file limit / 금지패턴 + 300줄 초과 차단
     │  GATE 2: completion check / 완료조건
     │  GATE 3: version tag v0.0.0 / 버전태그
     │  GATE 4: builder ≠ reviewer / 역할분리
     │  GATE 5: breaking change detection / 브레이킹 체인지 감지
     │
     ▼
⑤ REPORT ── code + tests + docs + git commit v0.x.0
```

---

## 16 Agents / 16개 에이전트

| Phase / 단계 | Agent | Role (EN) | 역할 (KO) | Model |
|------|-------|-----------|-----------|-------|
| PLANNER | DC-BIZ | Business Judge | 사업 타당성 판단 | Opus |
| PLANNER | DC-RES | Researcher | 리서치 | Haiku |
| PLANNER | DC-OSS | Open Source Scout | 오픈소스 탐색 | Opus |
| GENERATOR | DC-DEV-FE | Frontend Developer | 프론트엔드 개발 | Sonnet |
| GENERATOR | DC-DEV-BE | Backend Developer | 백엔드 개발 | Sonnet |
| GENERATOR | DC-DEV-DB | Database Engineer | 데이터베이스 설계 | Sonnet |
| GENERATOR | DC-DEV-MOB | Mobile Developer | 모바일 개발 | Sonnet |
| GENERATOR | DC-DEV-OPS | DevOps Engineer | DevOps / 인프라 | Sonnet |
| GENERATOR | DC-DEV-INT | Integration Engineer | 외부 API 연동 | Sonnet |
| GENERATOR | DC-WRT | Writer / Copywriter | 카피라이팅 | Sonnet |
| GENERATOR | DC-DOC | Documentation Writer | 문서 작성 | Haiku |
| GENERATOR | DC-SEO | SEO / AEO / GEO Specialist | SEO 최적화 | Haiku |
| EVALUATOR | DC-QA | QA Engineer | 품질 검증 | Haiku |
| EVALUATOR | DC-SEC | Security Reviewer | 보안 검토 | Opus |
| EVALUATOR | DC-REV | Code Reviewer | 코드 리뷰 | Opus |
| SUPPORT | DC-TOK | Token Optimizer | 토큰 비용 최적화 | Haiku |

---

## Commands / 명령어

**EN** — DOCORE installs commands from four sources: DOCORE CEO-* orchestrators, ECC (Everything Claude Code), gstack, and Superpowers.

**KO** — DOCORE는 네 가지 소스에서 커맨드를 설치합니다: DOCORE CEO-* 오케스트레이터, ECC, gstack, Superpowers.

---

### CEO-* Orchestrators / CEO-* 오케스트레이터 (DOCORE)

**EN** — CEO-* commands are the most powerful commands in DOCORE. Each one orchestrates multiple tools from ECC, gstack, and Superpowers simultaneously to maximize coverage and quality. Use these instead of running individual tools manually.

**KO** — CEO-* 커맨드는 DOCORE에서 가장 강력한 커맨드입니다. 각각 ECC, gstack, Superpowers의 여러 도구를 동시에 오케스트레이션하여 최대 커버리지와 품질을 확보합니다. 개별 도구를 수동으로 실행하는 대신 이것을 사용하세요.

| Command / 커맨드 | Description (EN) | 설명 (KO) | Tools Used / 사용 도구 |
|-----------------|-----------------|-----------|----------------------|
| `/ceo "task"` | Q&A → full 16-agent pipeline (PLANNER→GENERATOR→EVALUATOR→GATE→REPORT) | Q&A 후 16개 에이전트 전체 파이프라인 실행 | DC-BIZ, DC-RES, DC-OSS, all DEV agents, DC-QA, DC-SEC, DC-REV, DC-TOK |
| `/ceo-feature "feature"` | Full feature lifecycle: plan → TDD → implement → review → ship | 기능 전체 개발 라이프사이클: 기획→TDD→구현→리뷰→배포 | `/ceo-plan` + `/ceo-test` + `/ceo-review` + `/ceo-ship` |
| `/ceo-plan "feature"` | Q&A → BIZ validation → research → OSS scouting → implementation plan | Q&A → 사업 타당성 → 리서치 → OSS 탐색 → 구현 계획 | DC-BIZ, DC-RES, DC-OSS, ECC `/prp-plan`, gstack `/plan` |
| `/ceo-review` | Security → code quality → PR review — all review tools combined | 보안 → 코드 품질 → PR 리뷰 — 모든 리뷰 도구 결합 | ECC `/security-review` `/code-review` `/review-pr`, gstack `/review`, DC-SEC, DC-REV |
| `/ceo-test` | TDD → unit/integration → E2E → browser QA | TDD → 단위/통합 → E2E → 브라우저 QA | ECC `/tdd` `/test` `/e2e`, gstack `/qa` `/test`, DC-QA |
| `/ceo-ship` | Quality gate → review → build → deploy → post-deploy QA | 품질 게이트 → 리뷰 → 빌드 → 배포 → 배포 후 QA | gstack `/ship` `/qa`, ECC `/quality-gate` `/pipeline`, DC-DEV-OPS |
| `/ceo-design "ui"` | Direction → design system → components → visual review | 디자인 방향 → 디자인 시스템 → 컴포넌트 → 비주얼 리뷰 | gstack `/design*`, ECC `/ui-design`, DC-DEV-FE |
| `/ceo-debug "bug"` | Investigate → build fix → performance → verify | 조사 → 빌드 수정 → 성능 → 검증 | gstack `/investigate`, ECC `/debug` `/build-fix` `/perf-check` |
| `/ceo-quality` | Health → coverage → refactor → security → performance | 헬스 → 커버리지 → 리팩터 → 보안 → 성능 | gstack `/health`, ECC `/quality-gate` `/refactor-clean` `/perf-check`, DC-QA, DC-SEC, DC-REV |
| `/ceo-security` | Secrets scan → OWASP Top 10 → auth → API security | 시크릿 스캔 → OWASP Top 10 → 인증 → API 보안 | ECC `/security-review`, DC-SEC, DC-DEV-BE |
| `/ceo-doc` | Codemaps → API docs → project docs → release notes → SEO | 코드맵 → API 문서 → 프로젝트 문서 → 릴리즈 노트 → SEO | gstack `/docs` `/document-release`, ECC `/update-docs` `/update-codemaps`, DC-DOC, DC-SEO |
| `/ceo-learn` | Extract patterns → evaluate → save instincts → retro | 패턴 추출 → 평가 → 인스팅트 저장 → 회고 | gstack `/retro` `/learn`, ECC `/learn` `/learn-eval` `/instinct-*` |
| `/ceo-init` | Initialize project — registries, harness, CLAUDE.md | 프로젝트 최초 셋업 — 레지스트리, 하네스, CLAUDE.md | - |
| `/ceo-status` | Show current project status, active agents, gate results | 현재 상태, 활성 에이전트, 게이트 결과 조회 | - |

---

### ECC Commands / ECC 커맨드 (Everything Claude Code)

**EN** — 79 specialized commands installed from [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code).

**KO** — [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)에서 설치되는 79개의 전문 커맨드.

#### Planning / 기획
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/plan` | Step-by-step implementation plan — waits for user confirmation before coding | 단계별 구현 계획 — 코딩 전 사용자 확인 대기 |
| `/feature-dev` | Guided feature development with codebase analysis | 코드베이스 분석 기반 가이드 기능 개발 |
| `/implement` | Execute an implementation plan | 구현 계획 실행 |
| `/spec` | Generate technical specification | 기술 명세 생성 |
| `/prp-prd` | Interactive PRD generator — problem-first, hypothesis-driven | 문제 중심 인터랙티브 PRD 생성기 |
| `/prp-plan` | Comprehensive implementation plan with codebase pattern extraction | 코드베이스 패턴 추출 기반 상세 구현 계획 |
| `/prp-implement` | Execute PRP plan with rigorous validation loops | 검증 루프 포함 PRP 계획 실행 |
| `/prp-commit` | Smart commit with natural language file targeting | 자연어 파일 타겟팅으로 스마트 커밋 |
| `/prp-pr` | Create GitHub PR from current branch | 현재 브랜치에서 GitHub PR 생성 |
| `/multi-plan` | Multi-model collaborative planning | 멀티모델 협업 기획 |
| `/multi-execute` | Multi-model collaborative execution | 멀티모델 협업 실행 |
| `/multi-frontend` | Frontend-focused multi-model development | 프론트엔드 집중 멀티모델 개발 |
| `/multi-backend` | Backend-focused multi-model development | 백엔드 집중 멀티모델 개발 |
| `/multi-workflow` | Full multi-model collaborative workflow | 전체 멀티모델 협업 워크플로우 |

#### Code Review / 코드 리뷰
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/code-review` | Review local uncommitted changes or GitHub PR | 로컬 변경사항 또는 GitHub PR 리뷰 |
| `/review-pr` | Comprehensive PR review with specialized agents | 전문 에이전트 활용 종합 PR 리뷰 |
| `/security-review` | OWASP Top 10, secrets, injection, auth audit | OWASP Top 10, 시크릿, 인젝션, 인증 감사 |
| `/quality-gate` | Run all 5 quality gates and report status | 5개 품질 게이트 실행 및 결과 보고 |
| `/santa-loop` | Adversarial dual-review — two independent reviewers must both approve | 적대적 이중 리뷰 — 두 리뷰어 모두 PASS 필요 |
| `/refactor-clean` | Remove dead code, consolidate duplicates, clean unused imports | 데드코드 제거, 중복 통합, 미사용 import 정리 |
| `/perf-check` | Performance analysis — bottlenecks, bundle size, runtime speed | 성능 분석 — 병목, 번들 크기, 런타임 속도 |
| `/test-coverage` | Analyze test coverage gaps | 테스트 커버리지 부족 구간 분석 |
| `/python-review` | Python — PEP 8, type hints, security, idioms | Python — PEP 8, 타입 힌트, 보안, 관용구 |
| `/go-review` | Go — idiomatic patterns, concurrency, error handling | Go — 관용적 패턴, 동시성, 에러 처리 |
| `/rust-review` | Rust — ownership, lifetimes, unsafe, idioms | Rust — 소유권, 라이프타임, unsafe, 관용구 |
| `/cpp-review` | C++ — memory safety, modern idioms, concurrency | C++ — 메모리 안전성, 현대적 관용구, 동시성 |
| `/flutter-review` | Flutter/Dart — widgets, state management, performance | Flutter/Dart — 위젯, 상태 관리, 성능 |
| `/kotlin-review` | Kotlin — null safety, coroutines, Compose | Kotlin — null 안전성, 코루틴, Compose |

#### Test & TDD / 테스트 및 TDD
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/tdd` | TDD workflow — RED → GREEN → REFACTOR | TDD 워크플로우 — RED → GREEN → REFACTOR |
| `/test` | Run tests and report failures | 테스트 실행 및 실패 보고 |
| `/e2e` | End-to-end testing with Playwright | Playwright 기반 E2E 테스트 |
| `/go-test` | TDD for Go — table-driven tests, 80%+ coverage | Go TDD — 테이블 기반 테스트, 80%+ 커버리지 |
| `/rust-test` | TDD for Rust — write tests first, cargo-llvm-cov | Rust TDD — 테스트 먼저, cargo-llvm-cov |
| `/cpp-test` | TDD for C++ — GoogleTest first, then implement | C++ TDD — GoogleTest 먼저, 후 구현 |
| `/flutter-test` | Flutter/Dart — unit, widget, golden, integration | Flutter — 단위, 위젯, 골든, 통합 테스트 |
| `/kotlin-test` | TDD for Kotlin — Kotest + Kover | Kotlin TDD — Kotest + Kover |

#### Build & Fix / 빌드 및 수정
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/build-fix` | Diagnose and fix build errors incrementally | 빌드 오류 단계적 진단 및 수정 |
| `/go-build` | Fix Go build errors, go vet, linter issues | Go 빌드 오류, vet, 린터 수정 |
| `/rust-build` | Fix Rust build errors, borrow checker, Cargo | Rust 빌드, 빌림 검사기, Cargo 수정 |
| `/cpp-build` | Fix C++ build errors, CMake, linker problems | C++ 빌드, CMake, 링커 오류 수정 |
| `/flutter-build` | Fix Dart analyzer errors and Flutter build failures | Dart 분석기 오류, Flutter 빌드 실패 수정 |
| `/kotlin-build` | Fix Kotlin/Gradle build errors, compiler warnings | Kotlin/Gradle 빌드 오류, 컴파일러 경고 수정 |
| `/gradle-build` | Fix Gradle build errors for Android and KMP | Android/KMP Gradle 빌드 오류 수정 |

#### Debug / 디버그
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/debug` | Diagnose and fix bugs systematically | 체계적 버그 진단 및 수정 |
| `/evaluate-oss` | Evaluate open source library quality and fit | 오픈소스 라이브러리 품질 및 적합성 평가 |

#### Design & UI / 디자인 및 UI
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/design` | Design system and UI generation | 디자인 시스템 및 UI 생성 |
| `/ui-design` | UI component design and code generation | UI 컴포넌트 디자인 및 코드 생성 |

#### Session & Context / 세션 및 컨텍스트
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/save-session` | Save current session state to `~/.claude/session-data/` | 세션 상태를 `~/.claude/session-data/`에 저장 |
| `/resume-session` | Load most recent session and resume with full context | 최근 세션 로드 후 전체 컨텍스트로 재개 |
| `/sessions` | Manage Claude Code session history and metadata | 세션 히스토리 및 메타데이터 관리 |
| `/checkpoint` | Save a progress checkpoint | 진행상황 체크포인트 저장 |
| `/context-budget` | Monitor and manage context window usage | 컨텍스트 윈도우 사용량 모니터링 및 관리 |
| `/aside` | Answer a quick side question without losing task context | 현재 작업 컨텍스트를 잃지 않고 부가 질문 답변 |

#### Learning & Instincts / 학습 및 인스팅트
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/learn` | Extract reusable patterns from current session | 현재 세션에서 재사용 가능한 패턴 추출 |
| `/learn-eval` | Extract patterns, self-evaluate quality, save to right scope | 패턴 추출 후 품질 자체 평가하여 올바른 스코프에 저장 |
| `/evolve` | Analyze instincts and suggest evolved structures | 인스팅트 분석 후 개선 구조 제안 |
| `/instinct-status` | Show learned instincts with confidence scores | 신뢰도 점수 포함 학습된 인스팅트 표시 |
| `/instinct-import` | Import instincts from file or URL | 파일 또는 URL에서 인스팅트 가져오기 |
| `/instinct-export` | Export instincts to file | 인스팅트를 파일로 내보내기 |
| `/promote` | Promote project-scoped instincts to global scope | 프로젝트 인스팅트를 글로벌 스코프로 승격 |
| `/prune` | Delete stale pending instincts older than 30 days | 30일 이상 된 미사용 인스팅트 삭제 |
| `/projects` | List known projects and instinct statistics | 알려진 프로젝트 및 인스팅트 통계 목록 |

#### Hooks & Automation / 훅 및 자동화
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/hookify` | Create hooks from conversation analysis to prevent unwanted behaviors | 대화 분석으로 원치 않는 동작 방지 훅 생성 |
| `/hookify-configure` | Enable or disable hookify rules interactively | 훅 규칙 인터랙티브 활성화/비활성화 |
| `/hookify-help` | Get help with the hookify system | hookify 시스템 도움말 |
| `/hookify-list` | List all configured hookify rules | 설정된 모든 훅 규칙 목록 |

#### DevOps / 데브옵스
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/pipeline` | Set up CI/CD pipeline | CI/CD 파이프라인 설정 |
| `/pm2` | Initialize and configure PM2 process manager | PM2 프로세스 매니저 초기화 및 설정 |
| `/setup-pm` | Configure preferred package manager (npm/pnpm/yarn/bun) | 선호 패키지 매니저 설정 |
| `/devfleet` | Claude DevFleet multi-agent deployment | Claude DevFleet 멀티에이전트 배포 |

#### Docs & Reporting / 문서 및 보고
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/docs` | Documentation lookup via Context7 | Context7 기반 문서 조회 |
| `/update-docs` | Update project documentation | 프로젝트 문서 업데이트 |
| `/update-codemaps` | Regenerate codebase codemaps | 코드베이스 코드맵 재생성 |
| `/report` | Generate project status report | 프로젝트 상태 보고서 생성 |

#### Cost & Model Routing / 비용 및 모델 라우팅
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/cost-estimate` | Estimate token cost before running expensive operations | 비용이 큰 작업 실행 전 토큰 비용 추정 |
| `/model-route` | Route tasks to optimal model (Haiku/Sonnet/Opus) | 최적 모델로 작업 라우팅 (Haiku/Sonnet/Opus) |
| `/prompt-optimize` | Optimize prompts to reduce cost and improve accuracy | 비용 절감 및 정확도 향상을 위한 프롬프트 최적화 |

#### Loop & Orchestration / 루프 및 오케스트레이션
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/loop-start` | Start a recurring agent loop on an interval | 인터벌 기반 반복 에이전트 루프 시작 |
| `/loop-status` | Show status of running loops | 실행 중인 루프 상태 표시 |
| `/orchestrate` | Multi-agent orchestration workflow | 멀티에이전트 오케스트레이션 워크플로우 |
| `/santa-loop` | Adversarial dual-review convergence loop | 적대적 이중 리뷰 수렴 루프 |

#### Misc / 기타
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/jira` | Retrieve Jira ticket, update status, add comments | Jira 티켓 조회, 상태 업데이트, 댓글 추가 |
| `/skill-create` | Analyze git history to extract patterns and generate SKILL.md | git 히스토리 분석으로 패턴 추출 및 SKILL.md 생성 |
| `/skill-health` | Show skill portfolio health dashboard | 스킬 포트폴리오 헬스 대시보드 표시 |
| `/agent-sort` | Sort and prioritize agents for a task | 작업에 맞는 에이전트 정렬 및 우선순위 결정 |
| `/rules-distill` | Distill project rules from codebase patterns | 코드베이스 패턴에서 프로젝트 규칙 정제 |
| `/evaluate-oss` | Evaluate open source library quality and fit | 오픈소스 라이브러리 품질 및 적합성 평가 |
| `/spec` | Generate technical specification | 기술 명세 생성 |

---

### gstack Commands / gstack 커맨드

**EN** — 35+ battle-tested commands from [garrytan/gstack](https://github.com/garrytan/gstack) for shipping code.

**KO** — [garrytan/gstack](https://github.com/garrytan/gstack)에서 제공하는 35개 이상의 검증된 배포 워크플로우 커맨드.

#### Ship & Deploy / 배포
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/ship` | Full ship workflow — test, build, review, deploy | 전체 배포 워크플로우 — 테스트, 빌드, 리뷰, 배포 |
| `/land-and-deploy` | Land changes and deploy to production | 변경사항 랜딩 후 프로덕션 배포 |
| `/canary` | Deploy a canary release | 카나리 릴리즈 배포 |
| `/setup-deploy` | Set up deployment configuration | 배포 설정 구성 |

#### QA & Testing / QA 및 테스트
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/qa` | QA the running app — browser flows, screenshots, bugs | 실행 중인 앱 QA — 브라우저 플로우, 스크린샷, 버그 |
| `/qa-only` | QA without shipping | 배포 없이 QA만 |
| `/test` | Run tests | 테스트 실행 |
| `/benchmark` | Run performance benchmarks | 성능 벤치마크 실행 |

#### Code Review / 코드 리뷰
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/review` | Code review for current diff | 현재 diff 코드 리뷰 |
| `/health` | Project health — code quality, coverage, security | 프로젝트 헬스 — 코드 품질, 커버리지, 보안 |

#### Debug & Investigate / 디버그 및 조사
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/investigate` | Diagnose bugs and errors with root cause analysis | 버그 및 오류 근본 원인 분석 |

#### Planning / 기획
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/plan` | Plan a feature with interactive Q&A | 인터랙티브 Q&A로 기능 기획 |
| `/autoplan` | Auto-generate implementation plan from context | 컨텍스트 기반 자동 구현 계획 생성 |
| `/plan-ceo-review` | CEO-level plan review | CEO 레벨 계획 리뷰 |
| `/plan-eng-review` | Engineering architecture review | 엔지니어링 아키텍처 리뷰 |
| `/plan-design-review` | Design review at plan stage | 기획 단계 디자인 리뷰 |
| `/office-hours` | Brainstorm, product ideas, feasibility check | 브레인스토밍, 제품 아이디어, 타당성 검토 |

#### Design / 디자인
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/design` | Brand, design system, component guidelines | 브랜드, 디자인 시스템, 컴포넌트 가이드라인 |
| `/design-review` | Visual design review and polish | 비주얼 디자인 리뷰 및 폴리싱 |
| `/design-consultation` | Design direction consultation | 디자인 방향 컨설팅 |
| `/design-html` | Generate HTML/CSS from design specs | 디자인 명세에서 HTML/CSS 생성 |
| `/design-shotgun` | Rapid multi-direction design exploration | 다방향 빠른 디자인 탐색 |

#### Documentation / 문서
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/docs` | Update or generate documentation | 문서 업데이트 또는 생성 |
| `/document-release` | Update docs after shipping | 배포 후 문서 업데이트 |

#### Learning & Retro / 학습 및 회고
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/learn` | Extract and save learnings from session | 세션 학습 내용 추출 및 저장 |
| `/retro` | Weekly retrospective | 주간 회고 |
| `/checkpoint` | Save a progress checkpoint | 진행상황 체크포인트 저장 |

#### Safety & Guards / 안전 및 보호
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/freeze` | Freeze a file/module — stop all changes | 파일/모듈 동결 — 모든 변경 중지 |
| `/unfreeze` | Unfreeze a frozen file or module | 동결된 파일/모듈 해제 |
| `/guard` | Add guards to prevent regressions | 회귀 방지 가드 추가 |
| `/careful` | Enable extra-careful mode for sensitive changes | 민감한 변경에 초주의 모드 활성화 |

#### Browser & Setup / 브라우저 및 설정
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/browse` | Open and inspect a URL in the browser | 브라우저에서 URL 열기 및 검사 |
| `/connect-chrome` | Connect to a running Chrome instance | 실행 중인 Chrome 인스턴스 연결 |
| `/setup-browser-cookies` | Configure browser session cookies | 브라우저 세션 쿠키 설정 |

#### Misc / 기타
| Command / 커맨드 | Description (EN) | 설명 (KO) |
|-----------------|-----------------|-----------|
| `/codex` | Code exploration and understanding | 코드 탐색 및 이해 |
| `/cso` | Chief of Staff — communication triage and management | 참모장 — 커뮤니케이션 분류 및 관리 |
| `/gstack-upgrade` | Upgrade gstack to the latest version | gstack 최신 버전으로 업그레이드 |

---

## Quality Gates / 품질 게이트

**EN** — Every output passes 5 gates before delivery.

**KO** — 모든 산출물은 5개 게이트를 통과한 후 사용자에게 전달됩니다.

| Gate | Check (EN) | 검사 항목 (KO) |
|------|------------|---------------|
| GATE 1 | Error registry pattern scan + **file exceeds 300 lines** | 알려진 오류 패턴 차단 + **파일 300줄 초과 차단** |
| GATE 2 | Completion criteria verification | 완료 조건 충족 여부 |
| GATE 3 | Version tag `v0.0.0` present | 버전 태그 존재 여부 |
| GATE 4 | Builder ≠ Reviewer (role separation) | 개발자 ≠ 리뷰어 역할 분리 |
| GATE 5 | Breaking change detection | 브레이킹 체인지 감지 |

---

## Coding Standards / 코딩 표준

**EN** — Enforced on every file generated by agents.

**KO** — 에이전트가 생성하는 모든 파일에 강제 적용됩니다.

| Rule | EN | KO |
|------|----|----|
| File size | **300 lines max** (GATE 1 auto-blocks) | **파일당 300줄 이하** (GATE 1 자동 차단) |
| Function size | 50 lines max | 함수당 50줄 이하 |
| Nesting depth | 4 levels max | 중첩 4단계 이하 |
| Immutability | Always create new objects | 항상 새 객체 생성, 기존 객체 변경 금지 |
| Error handling | Explicit at every level | 모든 레벨에서 명시적 처리 |
| Input validation | Validate at all system boundaries | 모든 시스템 경계에서 검증 |

---

## Security Built-in / 내장 보안

**EN** — Security is enforced at every sprint, not as an afterthought.

**KO** — 보안은 사후 처리가 아닌 매 스프린트에 강제 적용됩니다.

| Rule (EN) | 규칙 (KO) |
|-----------|-----------|
| OWASP Top 10 review on every sprint | 매 스프린트 OWASP Top 10 검토 |
| JWT httpOnly cookies only (no localStorage) | JWT는 httpOnly 쿠키만 사용 (localStorage 금지) |
| AES-256-GCM for PII encryption | 개인정보 AES-256-GCM 암호화 |
| Rate limiting on all endpoints | 모든 엔드포인트 레이트 리미팅 |
| Input validation with Zod | Zod 기반 입력 검증 |
| RLS (Row Level Security) enforcement | RLS 필수 구현 |

---

## What Gets Installed / 설치 후 구조

**EN** — The installer places each file exactly where Claude Code expects it.

**KO** — 설치 스크립트가 Claude Code가 인식하는 위치에 정확히 파일을 배치합니다.

```
~/.claude/
├── CLAUDE.md                    ← Auto-loaded on every session / 세션마다 자동 로드
├── agents/
│   ├── dc-biz.md                ← 16 DOCORE agents / 16개 DOCORE 에이전트
│   └── ... (16 total / 16개)
├── commands/
│   ├── ceo.md                   ← /ceo — full pipeline
│   ├── ceo-feature.md           ← /ceo-feature — feature lifecycle
│   ├── ceo-plan.md              ← /ceo-plan — planning orchestrator
│   ├── ceo-review.md            ← /ceo-review — review orchestrator
│   ├── ceo-test.md              ← /ceo-test — test orchestrator
│   ├── ceo-ship.md              ← /ceo-ship — ship orchestrator
│   ├── ceo-design.md            ← /ceo-design — design orchestrator
│   ├── ceo-debug.md             ← /ceo-debug — debug orchestrator
│   ├── ceo-quality.md           ← /ceo-quality — quality orchestrator
│   ├── ceo-security.md          ← /ceo-security — security orchestrator
│   ├── ceo-doc.md               ← /ceo-doc — documentation orchestrator
│   ├── ceo-learn.md             ← /ceo-learn — learning orchestrator
│   ├── ceo-init.md              ← /ceo-init
│   ├── ceo-status.md            ← /ceo-status
│   └── ... (79 ECC commands / 79개 ECC 커맨드)
├── skills/
│   ├── ceo-system/SKILL.md      ← CEO orchestration brain / CEO 오케스트레이션
│   ├── gstack/                  ← gstack tools / gstack 도구
│   ├── superpowers/             ← Superpowers (or via plugin)
│   └── ... (183 ECC skills / 183개 ECC 스킬)
├── error-registry.md            ← Gate 1 error pattern log / 오류 패턴 로그
├── skill-registry.md            ← Skill registry / 스킬 레지스트리
├── project-registry.md          ← Project registry / 프로젝트 레지스트리
└── decision-log.md              ← Decision log / 결정 로그
```

---

## Repository Structure / 저장소 구조

```
docore/                          ← Source package / 소스 패키지
├── CLAUDE.md                    ← Copied to ~/.claude/CLAUDE.md
├── install.sh                   ← Installer / 설치 스크립트
├── agents/                      ← 16 agent definitions / 16개 에이전트 정의
│   ├── dc-biz.md ... dc-tok.md
├── commands/                    ← Slash commands / 슬래시 커맨드
│   ├── ceo.md                   ← /ceo
│   ├── ceo-feature.md           ← /ceo-feature
│   ├── ceo-plan.md              ← /ceo-plan
│   ├── ceo-review.md            ← /ceo-review
│   ├── ceo-test.md              ← /ceo-test
│   ├── ceo-ship.md              ← /ceo-ship
│   ├── ceo-design.md            ← /ceo-design
│   ├── ceo-debug.md             ← /ceo-debug
│   ├── ceo-quality.md           ← /ceo-quality
│   ├── ceo-security.md          ← /ceo-security
│   ├── ceo-doc.md               ← /ceo-doc
│   ├── ceo-learn.md             ← /ceo-learn
│   ├── ceo-init.md              ← /ceo-init
│   └── ceo-status.md            ← /ceo-status
├── skills/ceo-system/SKILL.md   ← CEO brain / CEO 두뇌
└── templates/                   ← Registry templates / 레지스트리 템플릿
    ├── error-registry.md
    ├── skill-registry.md
    ├── project-registry.md
    └── decision-log.md
```

---

## Manual Install / 수동 설치

```bash
git clone https://github.com/DoCoreTeam/docore.git /tmp/docore
bash /tmp/docore/docore/install.sh
```

---

## Dependencies / 의존성

**EN** — DOCORE relies on three external systems. The installer handles all automatically.

**KO** — DOCORE는 세 가지 외부 시스템에 의존합니다. 설치 스크립트가 자동으로 처리합니다.

| Dependency | Repo | What it provides (EN) | 제공 내용 (KO) | Installed to |
|------------|------|----------------------|----------------|-------------|
| **ECC** | [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) | 183 skills + 79 commands | 스킬 183개 + 커맨드 79개 | `~/.claude/skills/` + `~/.claude/commands/` |
| **gstack** | [garrytan/gstack](https://github.com/garrytan/gstack) | Garry Tan's 23-tool setup | Garry Tan의 23개 도구 | `~/.claude/skills/gstack/` |
| **Superpowers** | obra/superpowers-marketplace | Claude Code marketplace superpowers | Claude Code 마켓플레이스 슈퍼파워 | via `claude plugin` or `~/.claude/skills/superpowers/` |

---

## Requirements / 요구사항

| Requirement (EN) | 요구사항 (KO) |
|-----------------|--------------|
| [Claude Code](https://claude.ai/code) CLI | Claude Code CLI |
| Anthropic API key with Opus, Sonnet, and Haiku access | Opus, Sonnet, Haiku 모델 접근 권한이 있는 Anthropic API 키 |
| git (for installer) | git (설치 스크립트용) |

---

## License / 라이선스

MIT — see [LICENSE](LICENSE)

---

## Author / 만든 사람

Built by **Docore** / DoCoreTeam
