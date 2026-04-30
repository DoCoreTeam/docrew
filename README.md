
```
██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗ █████╗ 
██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔══██╗
██║  ██║██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ███╗███████║███████║
██║  ██║██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══██║
██████╔╝╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║  ██║
╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
```

<div align="center">

### 🚗💨 돔황차 — *개발 지옥에서 도망쳐*
#### Your AI getaway car from development hell.

**AI 개발 자동화 도구 · AI Development Automation Tool**

[![Version](https://img.shields.io/badge/version-2.0.12-brightgreen?style=for-the-badge&logo=github)](https://github.com/DoCoreTeam/domangcha/blob/main/domangcha/VERSION)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Required-5865F2?style=for-the-badge)](https://claude.ai/code)
[![Agents](https://img.shields.io/badge/Agents-16-FF6B6B?style=for-the-badge)](https://github.com/DoCoreTeam/domangcha#the-16-agents)
[![Gates](https://img.shields.io/badge/Gates-5-orange?style=for-the-badge)](https://github.com/DoCoreTeam/domangcha#the-5-gates)

<br/>

> **16명의 엔지니어링 팀을 단 한 줄로 채용하세요.**
> You just hired a 16-person engineering team. With one command.

```bash
curl -sSL https://raw.githubusercontent.com/DoCoreTeam/domangcha/main/domangcha/install.sh | bash
```

```bash
/ceo "Build a SaaS app with auth, payments, and a dashboard"
```

</div>

---

## ⚡ Why DOMANGCHA?

<table>
<tr>
<td width="50%">

**🤖 다른 AI 도구들**

```
엔터 치자마자 코드 200줄
└── "일단 짜고 봐"
    └── 틀린 방향, 낭비된 스프린트
        └── 다시 처음부터...
```

</td>
<td width="50%">

**🚗💨 DOMANGCHA**

```
엔터 → "잠깐, 질문이 있어요"
└── 12개 정확한 질문
    └── 16명 전문가 병렬 투입
        └── 5개 게이트 → 출시
```

</td>
</tr>
</table>

| | DOMANGCHA | 일반 AI 도구 |
|---|:---:|:---:|
| 코드 전 요구사항 분석 | ✅ 최대 12 질문 | ❌ 바로 코딩 |
| 전문가 역할 분리 | ✅ 16명 병렬 | ❌ 1개 모델 |
| 자기 코드 자기 리뷰 금지 | ✅ 강제 분리 | ❌ 없음 |
| 파괴적 변경 보호 | ✅ Gate 5 차단 | ❌ 없음 |
| 실수 → 영구 패턴 등록 | ✅ error-registry | ❌ 없음 |

---

## 🔄 Pipeline

```
/ceo "SaaS 만들어줘"  /  /ceo "Build a SaaS"
           │
           ▼
    ┌─────────────┐
    │  STACK SEL  │  CEO가 업무 분석 후 최적 스택 추천
    │  스택 선택  │  CEO recommends the best stack for your task
    └──────┬──────┘
           │  [1] Standard    ████████ 80%  16 agents, full pipeline
           │  [2] Ralph Loop  ██████   60%  autonomous until done
           │  [3] gstack      ████     40%  web E2E + browser QA
           │  [4] Superpowers ██       25%  design-first, plan-heavy
           ▼
    ┌─────────────┐
    │    Q & A    │  최대 12개 질문 (한 번에 하나씩, 적응형)
    │    질  문   │  Up to 12 questions — adaptive, one at a time
    └──────┬──────┘
           │  스택? 완료 기준? 외부 API? 인증? 배포?
           ▼
    ┌─────────────┐
    │  DOC-FIRST  │  ← 절대 불변 / IMMUTABLE — all stacks, no exceptions
    │  문서 먼저  │
    └──────┬──────┘
           │  docs/YYYY-MM-DD-vX.X.X/
           │  ├── 00-requirements.md       기능/비기능 요구사항
           │  ├── 01-architecture.md       시스템 설계, 데이터 흐름
           │  ├── 02-task-breakdown.md     태스크 + 우선순위 P0/P1/P2
           │  ├── 03-test-strategy.md      테스트 전략 + 보안 기준
           │  └── 04-completion-criteria.md 완료 조건 + 종료 + 롤백
           │  ↳ 기획자 자가점검 → 갭 발견 시 추가 질문 → [DOC COMPLETE]
           ▼
    ┌─────────────┐
    │   PLANNER   │  DC-BIZ · DC-RES · DC-OSS  (병렬 / parallel)
    └──────┬──────┘
           ▼
    ┌─────────────┐
    │   BUILDER   │  DB · BE · FE · OPS · DOC  (병렬 CORE)
    │   빌  더   │  + MOB · INT · WRT · SEO   (필요 시 / on demand)
    └──────┬──────┘
           │  implement → ripple analysis → review  (max 3 loops)
           ▼
    ┌─────────────┐
    │  EVALUATOR  │  DC-QA + DC-SEC + DC-REV   (동시 / simultaneous)
    └──────┬──────┘
           ▼
    ┌─────────────┐
    │  GATE 1–5  │  전부 통과해야 출시 / all must pass before ship
    └──────┬──────┘
           ▼
        🚀 SHIP
```

---

## 👥 The 16 Agents

<table>
<thead>
<tr><th>Phase</th><th>Agent</th><th>Role · 역할</th><th>Model</th></tr>
</thead>
<tbody>
<tr><td rowspan="3"><b>🧠 PLANNER</b></td>
  <td><code>DC-BIZ</code></td><td>Business Judge · 사업 타당성 판단</td><td>Opus</td></tr>
<tr><td><code>DC-RES</code></td><td>Researcher · 기술 리서치</td><td>Sonnet</td></tr>
<tr><td><code>DC-OSS</code></td><td>OSS Scout · 외부 도구 탐색</td><td>Opus</td></tr>
<tr><td rowspan="9"><b>🔨 BUILDER</b></td>
  <td><code>DC-DEV-DB</code></td><td>Database Engineer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DEV-BE</code></td><td>Backend Developer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DEV-FE</code></td><td>Frontend Developer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DEV-OPS</code></td><td>DevOps Engineer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DEV-MOB</code></td><td>Mobile Developer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DEV-INT</code></td><td>Integration Engineer</td><td>Sonnet</td></tr>
<tr><td><code>DC-DOC</code></td><td>Documentation Writer · 문서 작성</td><td>Haiku</td></tr>
<tr><td><code>DC-WRT</code></td><td>Copywriter · 카피라이터</td><td>Haiku</td></tr>
<tr><td><code>DC-SEO</code></td><td>SEO / AEO / GEO</td><td>Haiku</td></tr>
<tr><td rowspan="3"><b>🔍 EVALUATOR</b></td>
  <td><code>DC-QA</code></td><td>QA Engineer · 기능 테스트</td><td>Sonnet</td></tr>
<tr><td><code>DC-SEC</code></td><td>Security Reviewer · 보안 검토</td><td>Opus</td></tr>
<tr><td><code>DC-REV</code></td><td>Code Reviewer · 코드 리뷰</td><td>Opus</td></tr>
<tr><td><b>⚙️ SUPPORT</b></td>
  <td><code>DC-TOK</code></td><td>Token Optimizer · 토큰 예산 관리</td><td>Haiku</td></tr>
</tbody>
</table>

> **CORE** (always runs) — BIZ, RES, OSS, DB, BE, FE, OPS, QA, SEC, REV, DOC, TOK  
> **EXTENDED** (on demand) — MOB, INT, WRT, SEO

---

## 🛡️ The 5 Gates

> Every output must pass **all five**. No exceptions. 예외 없음.

| Gate | Check · 검증 항목 |
|:---:|---|
| **① SCAN** | error-registry 패턴 스캔 + **300줄 초과 파일 자동 차단** |
| **② CRITERIA** | 완료 조건 충족 100% 검증 |
| **③ VERSION** | 버전 태그 = `domangcha/VERSION` 일치 |
| **④ SEPARATION** | Builder ≠ Reviewer 역할 분리 강제 |
| **⑤ BREAKING** | 파괴적 변경 → **사용자 명시 승인 필수** |

---

## 🖥️ Commands

| Command | What it does · 동작 |
|---|---|
| `/ceo "[task]"` | 🚀 Full pipeline — Q&A → 16 agents → GATE → ship |
| `/ceo-ralph "[task]"` | 🔁 Autonomous loop until completion criteria met |
| `/ceo-init` | 🔧 Project harness setup · 프로젝트 초기화 |
| `/ceo-debug "[bug]"` | 🐛 Investigate → fix → verify |
| `/ceo-review` | 🔍 Security + quality + PR review |
| `/ceo-test` | ✅ TDD + unit + E2E + browser QA |
| `/ceo-ship` | 📦 Gate → review → build → deploy |
| `/ceo-status` | 📊 현황 조회 · Show current status |

---

## 📐 Coding Standards

Non-negotiable. Gate 1 enforces on every file. 타협 불가, Gate 1이 전체 강제.

```
✓ 파일당 최대 300줄  ·  함수당 최대 50줄  ·  중첩 최대 4단계
✓ 불변성(Immutability) — 항상 새로 만들고, 절대 변경하지 않기
✓ 모든 계층에서 명시적 에러 처리  ·  모든 경계에서 입력 검증
✓ 모든 기능에 테스트 필수  ·  모든 테이블에 RLS 적용
```

---

## 📦 Requirements

| | |
|---|---|
| [Claude Code](https://claude.ai/code) | Required · 필수 |
| Anthropic API Key | Opus + Sonnet + Haiku access |
| `git` | For installer · 설치용 |

---

## 🚀 Install · 설치

```bash
# Install or update · 설치 또는 업데이트
curl -sSL https://raw.githubusercontent.com/DoCoreTeam/domangcha/main/domangcha/install.sh | bash
```

```bash
# Update from inside Claude Code · Claude Code 내에서 업데이트
/ceo-update
```

> Re-running always pulls the latest. Your registries (errors, instincts, history) are preserved.  
> 재실행하면 항상 최신 버전을 가져옵니다. 레지스트리(에러, 본능, 히스토리)는 보존됩니다.

---

<details>
<summary><b>🇰🇷 한국어 상세 설명 (클릭하여 펼치기)</b></summary>

<br/>

### 왜 DOMANGCHA인가

**당신이 엔터를 치는 그 0.3초, 다른 AI는 이미 틀린 코드 200줄을 짜고 있습니다.**

DOMANGCHA는 다릅니다 — 코드 한 줄 쓰기 전에 "잠깐, 질문이 있어요"부터 시작합니다. 그다음 플래너, 빌더, 평가자를 전부 병렬로 굴리고, 검토를 못 통과한 건 가차없이 반려합니다.

- **코드 전에 최대 12개 질문.** 귀찮으시죠? 그게 당신의 스프린트를 살립니다.
- **16명의 전문가, 명령 하나.** 채용 공고, 면접, 연봉 협상 전부 필요 없습니다.
- **5개의 게이트(Gate). "이번 한 번만"은 없습니다.** 300줄 초과 파일은 자동 차단.
- **빌더 ≠ 리뷰어. 항상.** 자기 코드 자기가 리뷰하는 건 자기 요리 자기가 별점 매기는 것과 같습니다.
- **실수해도 됩니다. 단, 두 번은 안 됩니다.** 모든 실수는 즉시 Gate 패턴으로 등록되어 영원히 반복되지 않습니다.

### DOC-FIRST — 절대 불변 규칙

Q&A 완료 직후, **어떤 스택을 선택했든** 구현 전에 반드시 기획 문서를 작성합니다:

```
docs/YYYY-MM-DD-vX.X.X/
├── 00-requirements.md        기능/비기능 요구사항
├── 01-architecture.md        시스템 설계, 데이터 흐름
├── 02-task-breakdown.md      태스크 목록 + 우선순위(P0/P1/P2)
├── 03-test-strategy.md       테스트 우선순위 · 보안/보완 테스트 기준
└── 04-completion-criteria.md 완료 조건 · 종료 기준 · 롤백 기준
```

기획자(DC-BIZ)가 자가점검 → 갭 발견 시 사용자에게 추가 질문 → `[DOC COMPLETE]` 확인 후에만 구현 시작.

### 에이전트 모델 배정

| 에이전트 | 모델 | 이유 |
|---|---|---|
| DC-BIZ, DC-OSS, DC-SEC, DC-REV | **Opus** | 판단·보안·리뷰 — 가장 깊은 추론 필요 |
| DC-RES, DC-QA, DC-DEV-* | **Sonnet** | 개발·분석 — 속도와 품질의 균형 |
| DC-WRT, DC-DOC, DC-SEO, DC-TOK | **Haiku** | 경량 작업 — 비용 효율적 운영 |

</details>

---

<div align="center">

**개발 지옥에서 도망쳐. 🚗💨 돔황차가 데려다 줄게.**  
*Escape development hell. DOMANGCHA is your getaway car.*

<br/>

[![GitHub](https://img.shields.io/badge/GitHub-DoCoreTeam-181717?style=for-the-badge&logo=github)](https://github.com/DoCoreTeam/domangcha)
[![Made by](https://img.shields.io/badge/Made%20by-docore-FF6B6B?style=for-the-badge)](https://github.com/DoCoreTeam)

*Built with **DOMANGCHA** · by [docore](https://github.com/DoCoreTeam) (Michael Dohyeon Kim · KDC CEO)*

MIT License

</div>
