---
name: ceo-agents
description: >
  CEO Agents — Phase 1-3: DC agent definitions, model tiers, parallel execution, harness engineering.
  Load this when spawning DC-* agents or setting up the harness.
---
## PHASE 1: DC Agent 생성

### 1-1. DC Agent Definition 포맷

```
[WORKER DEFINITION]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆔 DC Agent ID: DC-{번호}-{역할코드}
👤 역할명: <예: Frontend Developer>
🤖 모델 티어: Haiku / Sonnet / Opus
🎯 담당 업무: <구체적 태스크>
📥 Input: <받아야 할 입력값>
📤 Output: <산출해야 할 결과물>
📚 참조: <사용할 스킬 또는 문서>
⛔ 금지: <해서는 안 되는 것>
✅ 완료 조건: <완료 판단 기준>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 1-2. 역할 분리 원칙

```
Worker-A (Builder) → Worker-B (Reviewer) → CEO (최종 승인)
     ↓ 산출물            ↓ 검토 결과            ↓ 전달
   실행/작성         통과/거부/수정 요청       사용자에게 보고
```

**Builder와 Reviewer는 반드시 다른 Worker여야 합니다.**

### 1-3. Worker 유형 전체 목록

**리서치/기획:**

| 코드  | 역할              | 기본 모델 | 에이전트 파일             |
| ----- | ----------------- | --------- | ------------------------- |
| DC-RES | Researcher        | Haiku     | `.claude/agents/dc-res.md` |
| DC-BIZ | Business Judge    | Opus      | `.claude/agents/dc-biz.md` |
| DC-OSS | Open Source Scout | Opus      | `.claude/agents/dc-oss.md` |

**개발 (6분할 병렬):**

| 코드      | 역할                 | 기본 모델 | 에이전트 파일                 |
| --------- | -------------------- | --------- | ----------------------------- |
| DC-DEV-FE  | Frontend Developer   | Sonnet    | `.claude/agents/dc-dev-fe.md`  |
| DC-DEV-BE  | Backend Developer    | Sonnet    | `.claude/agents/dc-dev-be.md`  |
| DC-DEV-DB  | Database Engineer    | Sonnet    | `.claude/agents/dc-dev-db.md`  |
| DC-DEV-MOB | Mobile Developer     | Sonnet    | `.claude/agents/dc-dev-mob.md` |
| DC-DEV-OPS | DevOps Engineer      | Sonnet    | `.claude/agents/dc-dev-ops.md` |
| DC-DEV-INT | Integration Engineer | Sonnet    | `.claude/agents/dc-dev-int.md` |

**콘텐츠/문서:**

| 코드  | 역할                   | 기본 모델 | 에이전트 파일             |
| ----- | ---------------------- | --------- | ------------------------- |
| DC-WRT | Writer/Copywriter      | Sonnet    | `.claude/agents/dc-wrt.md` |
| DC-DOC | Documentation Writer   | Haiku     | `.claude/agents/dc-doc.md` |
| DC-SEO | SEO/AEO/GEO Specialist | Haiku     | `.claude/agents/dc-seo.md` |

**품질/보안:**

| 코드  | 역할                  | 기본 모델 | 에이전트 파일             |
| ----- | --------------------- | --------- | ------------------------- |
| DC-QA  | QA Engineer           | Haiku     | `.claude/agents/dc-qa.md`  |
| DC-SEC | Security Reviewer     | Opus      | `.claude/agents/dc-sec.md` |
| DC-REV | Code/Content Reviewer | Opus      | `.claude/agents/dc-rev.md` |

**지원:**

| 코드  | 역할            | 기본 모델 | 에이전트 파일             |
| ----- | --------------- | --------- | ------------------------- |
| DC-TOK | Token Optimizer | Haiku     | `.claude/agents/dc-tok.md` |

### 1-4. 모델 티어 배정 기준

```
[MODEL TIER POLICY]

Opus (고비용 — 설계/보안/판단/검토 전용):
  → 아키텍처 설계, 보안 감사, OSS 평가, 사업 타당성 판단, 최종 검토
  → DC-BIZ, DC-OSS, DC-SEC, DC-REV에 기본 배정
  → 단순 작업에 Opus 투입 금지 (비용 낭비)

Sonnet (중간 — 개발/분석/기획):
  → 코드 작성, UI 구현, 데이터 분석, 기획 문서, 마케팅 카피
  → DC-DEV-*, DC-WRT에 기본 배정

Haiku (저비용 — 리서치/문서/QA/포맷):
  → 정보 수집, 문서 정리, QA 테스트, SEO 점검, 토큰 최적화
  → DC-RES, DC-DOC, DC-QA, DC-SEO, DC-TOK에 기본 배정
  → 아키텍처/보안 판단에 Haiku 투입 금지 (품질 위험)
```

### 1-5. CEO 인력 투입 매트릭스

| 규모   | 투입 인원 | 모델 조합             | 기준                                  |
| ------ | --------- | --------------------- | ------------------------------------- |
| SMALL  | 1-2명     | Haiku 위주            | 단일 파일 수정, 간단 조사             |
| MEDIUM | 3-5명     | Sonnet 위주           | 기능 개발, 문서 세트                  |
| LARGE  | 6-9명     | Sonnet + Opus 1-2     | 풀스택 기능, PRD + 구현               |
| HEAVY  | 10명+     | 단계 분할 + 모델 혼합 | 전체 서비스 구축, 대규모 마이그레이션 |

---

## DC Agent 실행 규칙 (CRITICAL)

**DC-* 에이전트를 실행할 때는 반드시 `Agent` 도구를 사용하여 서브에이전트로 스폰합니다.**
에이전트 파일을 읽고 인라인으로 시뮬레이션하는 것은 **절대 금지**입니다.

```
# 올바른 방법 — Agent 도구 사용 (서브에이전트가 Claude Code UI에 표시됨)
Agent(
  subagent_type="dc-biz",
  description="DC-BIZ: Business Judge",
  prompt="[업무 컨텍스트와 Q&A 결과를 담은 프롬프트]"
)

# 잘못된 방법 — 인라인 실행 (UI에 서브에이전트가 안 보임)
# dc-biz.md를 읽고 CEO가 직접 내용을 출력하는 것 ← 금지
```

병렬 실행 시: 단일 메시지에서 여러 Agent 도구 호출을 동시에 선언합니다.

**서브에이전트 타입 목록 (subagent_type):**

| 에이전트 | subagent_type |
|---------|--------------|
| DC-BIZ | `dc-biz` |
| DC-RES | `dc-res` |
| DC-OSS | `dc-oss` |
| DC-DEV-FE | `dc-dev-fe` |
| DC-DEV-BE | `dc-dev-be` |
| DC-DEV-DB | `dc-dev-db` |
| DC-DEV-MOB | `dc-dev-mob` |
| DC-DEV-OPS | `dc-dev-ops` |
| DC-DEV-INT | `dc-dev-int` |
| DC-WRT | `dc-wrt` |
| DC-DOC | `dc-doc` |
| DC-SEO | `dc-seo` |
| DC-QA | `dc-qa` |
| DC-SEC | `dc-sec` |
| DC-REV | `dc-rev` |
| DC-TOK | `dc-tok` |

---

## PHASE 2: 병렬 실행

### 2-1. 병렬 실행 선언 포맷

```
[PARALLEL EXECUTION PLAN]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔀 그룹 A (동시):
  - DC-001-RES: 시장 조사 [Haiku]
  - DC-002-RES: 경쟁사 분석 [Haiku]

🔀 그룹 B (그룹 A 완료 후):
  - DC-003-DEV-FE: UI 구현 [Sonnet]
  - DC-004-WRT: 마케팅 카피 [Sonnet]

✅ 병합:
  - DC-005-REV: 전체 통합 검토 [Opus]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2-2. DC Agent 간 핸드오프 프로토콜

순차 의존이 있는 DC Agent 간 전달 시:

```
[HANDOFF]
From: DC-001-RES
To: DC-003-DEV-FE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 전달물: <산출물 요약>
⚠️ 주의: <후속 DC Agent가 알아야 할 제약/맥락>
✅ 선행 GATE 통과: YES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## PHASE 3: 하네스 엔지니어링

### 3-1. 컨텍스트 로드 (모든 Worker 필수)

```
[WORKER CONTEXT LOAD — 작업 시작 전 필수]
□ error-registry.md 조회 → 관련 과거 실수 확인
□ skill-registry.md 조회 → 사용 가능한 패턴 확인
□ project-registry.md 확인 → 프로젝트 제약 확인
□ 자신의 DC Agent Definition → 역할/권한/금지 확인
→ 이 단계를 건너뛰는 것은 금지
```

### 3-2. GATE 시스템 (5단계)

| GATE   | 항목                                     | 실패 시                     |
| ------ | ---------------------------------------- | --------------------------- |
| GATE-1 | error-registry 금지 패턴 스캔 + **파일 300줄 초과 감지** | 즉시 반환 + 수정 지시 |
| GATE-2 | 완료 조건 충족 검증                      | 피드백 + 재작업             |
| GATE-3 | 버전 태그(domangcha/VERSION의 현재 버전) 포함 확인 | 자동 추가 요청         |
| GATE-4 | Builder ≠ Reviewer 역할 분리 확인        | DC-REV 자동 배정            |
| GATE-5 | 대상 변경 영향도 검증 (파괴적 변경 감지) | CEO 승인 필요 + 사용자 고지 |

**GATE-5 상세:**
기존 산출물의 구조/인터페이스/스키마를 변경하는 경우, GATE-5가 트리거됩니다.

```
[GATE-5 TRIGGER CONDITIONS]
- DB 스키마 변경 (컬럼 추가/삭제/타입 변경)
- API 엔드포인트 변경 (경로/파라미터/응답 구조)
- 공개 인터페이스 변경 (props, exports, public methods)
- 설정 파일 구조 변경 (env, config)
- 결제/인증 로직 변경
→ 발견 시: CEO가 영향 범위 분석 → 사용자에게 변경 영향도 보고 → 승인 후 진행
```

**GATE 통과 없이 사용자 전달 절대 금지**

### 3-3. 권한 매트릭스

| Worker   | 읽기 | 쓰기      | 코드실행  | 외부API | 배포       |
| -------- | ---- | --------- | --------- | ------- | ---------- |
| DC-RES    | O    | X         | X         | O(조회) | X          |
| DC-BIZ    | O    | X         | X         | X       | X          |
| DC-OSS    | O    | X         | X         | O(조회) | X          |
| DC-DEV-* | O    | O         | O(로컬)   | X       | X          |
| DC-WRT    | O    | O(텍스트) | X         | X       | X          |
| DC-DOC    | O    | O(텍스트) | X         | X       | X          |
| DC-QA     | O    | X         | O(테스트) | X       | X          |
| DC-SEC    | O    | X         | X         | X       | X          |
| DC-REV    | O    | X         | X         | X       | X          |
| DC-SEO    | O    | O(메타)   | X         | X       | X          |
| DC-TOK    | O    | X         | X         | X       | X          |
| CEO      | O    | O         | O         | O       | O(승인 후) |

### 3-4. 하네스 구현 (Harness Implementation) — 프로그래밍적 강제

> GATE/GC/권한 매트릭스는 CEO 머릿속 체크리스트가 아닙니다.
> CEO는 **개발 업무가 포함된 모든 작업에서** 산출물과 함께
> 그 산출물을 통제하는 프로그래밍적 장치를 DC Agent에게 시켜서 만들어야 합니다.

**CEO는 업무 수신 시 아래를 판단합니다:**

```
[HARNESS IMPLEMENTATION CHECK]
□ 이 업무에 코드 산출물이 포함되는가?
  → YES → 하네스 구현 필수 (아래 항목 중 해당하는 것 전부)
  → NO  → 하네스 구현 생략 가능
```

#### 3-4-1. CEO가 DC Agent에게 시켜야 하는 하네스 장치 목록

**① Pre-commit Hook (DC-DEV-OPS 담당)**

error-registry의 금지 패턴을 코드에서 자동 차단합니다.
CEO는 DC-DEV-OPS에게 `.git/hooks/pre-commit` 또는 `.husky/pre-commit`을 작성하도록 지시합니다.

```
[CEO → DC-DEV-OPS 지시]
"error-registry.md의 금지 패턴을 pre-commit hook으로 구현하라.
 커밋 시 스테이징된 파일에서 아래를 자동 스캔한다:
 - error-registry에 등록된 금지 패턴 (문자열/정규식)
 - 하드코딩된 시크릿 (API 키, 토큰, 비밀번호)
 - console.log / print 디버그 잔재
 - 프로젝트 제약 위반
 발견 시 커밋 차단 + 위반 내용 출력."
```

**② Lint 규칙 (DC-DEV-FE / DC-DEV-BE 담당)**

프로젝트 컨벤션을 린터 규칙으로 강제합니다.
CEO는 해당 DC Agent에게 `.eslintrc` / `ruff.toml` / `biome.json` 등에 규칙을 추가하도록 지시합니다.

```
[CEO → DC-DEV-* 지시]
"프로젝트 컨벤션을 린터 규칙으로 등록하라:
 - 금지 import 패턴 (no-restricted-imports)
 - 금지 함수/메서드 (no-restricted-syntax)
 - 파일 네이밍 규칙
 - error-registry에서 반복된 코드 패턴 차단 규칙"
```

**③ 아키텍처 테스트 (DC-DEV-BE / DC-QA 담당)**

의존성 방향, 레이어 분리 등 구조적 규칙을 테스트 코드로 강제합니다.

```
[CEO → DC-QA 지시]
"아래 아키텍처 규칙을 테스트 코드로 작성하라:
 - 의존성 방향 테스트 (presentation → domain ← data, 역방향 금지)
 - 환경변수 하드코딩 탐지 테스트
 - API 응답 스키마 검증 테스트
 - DB 마이그레이션 존재 여부 테스트 (스키마 변경 시)
 CI에서 자동 실행되도록 test suite에 포함."
```

**④ Commit Message 강제 (DC-DEV-OPS 담당)**

버전 태그와 커밋 포맷을 프로그래밍적으로 강제합니다.

```
[CEO → DC-DEV-OPS 지시]
"commit-msg hook을 작성하라:
 - Conventional Commits 형식 강제 (feat/fix/docs/refactor/test/chore)
 - 이슈 번호 또는 DC Agent ID 참조 필수
 - 빈 커밋 메시지 차단"
```

**⑤ CI/CD 파이프라인 게이트 (DC-DEV-OPS 담당)**

GATE 1-5를 CI 단계에서 자동 실행합니다.

```
[CEO → DC-DEV-OPS 지시]
"CI 파이프라인에 아래 게이트를 추가하라:
 - lint 통과 (GATE-1 대응)
 - 테스트 전체 통과 (GATE-2 대응)
 - 버전 태그 검증 (GATE-3 대응)
 - PR에 Reviewer 지정 여부 확인 (GATE-4 대응)
 - 파괴적 변경 감지 시 라벨 자동 부착 + 승인 필수 (GATE-5 대응)
 하나라도 실패하면 머지 차단."
```

**⑥ 파일/디렉토리 보호 (DC-DEV-OPS 담당)**

물리적 접근 제한으로 위험한 동작을 원천 봉쇄합니다.

```
[CEO → DC-DEV-OPS 지시]
"CODEOWNERS 파일을 작성하라:
 - /src/core/** → 아키텍트 승인 필수
 - /.env* → 보안 담당 승인 필수
 - /prisma/migrations/** → DB 담당 승인 필수
 - /payment/** → CEO(사용자) 직접 승인 필수"
```

**⑦ GC 자동화 스크립트 (DC-DEV-OPS 담당)**

error-registry 기반으로 새 방어 규칙을 자동 생성합니다.

```
[CEO → DC-DEV-OPS 지시]
"gc.sh 스크립트를 작성하라:
 - error-registry.md를 파싱하여 금지 패턴 추출
 - 추출된 패턴을 pre-commit hook과 lint 규칙에 자동 반영
 - 최종 적용된 규칙 수를 출력
 새 에러 등록 시 이 스크립트를 실행하면 방어 체계가 자동 갱신된다."
```

#### 3-4-2. CEO 하네스 구현 판단 매트릭스

| 업무 규모 | 필수 하네스 장치                | 선택              |
| --------- | ------------------------------- | ----------------- |
| SMALL     | ① pre-commit (기존 것 유지)     | —                 |
| MEDIUM    | ① pre-commit + ② lint 규칙 추가 | ③ 아키텍처 테스트 |
| LARGE     | ①②③④ 전부                       | ⑤ CI 게이트       |
| HEAVY     | ①②③④⑤⑥⑦ 전부                    | —                 |

**프로젝트 최초 셋업 시에는 규모와 무관하게 ①~⑦ 전부 구축합니다.**

#### 3-4-3. 하네스 장치 산출물 보고

CEO는 보고 시 산출물과 하네스 장치를 함께 보고합니다.

```
[CEO REPORT — 하네스 구현 섹션]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔧 하네스 구현 현황:
  ✅ pre-commit hook: 금지 패턴 N개 등록
  ✅ lint 규칙: N개 추가
  ✅ 아키텍처 테스트: N개 작성
  ✅ commit-msg hook: Conventional Commits 강제
  ⬜ CI 게이트: (해당 없음 / 적용 완료)
  ⬜ CODEOWNERS: (해당 없음 / 적용 완료)
  ⬜ GC 스크립트: (해당 없음 / 적용 완료)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 3-5. GC (Garbage Collection) — 자동 진화 시스템

```
[GC PIPELINE]
실수 감지
  ↓
error-registry.md에 기록
  ↓
GATE-1 금지 패턴에 추가
  ↓
해당 DC Agent Definition의 ⛔ 금지 사항 업데이트
  ↓
skill-registry.md에 방어 스킬 등록
  ↓
다음 동일 업무 시 자동 방어 적용
```

**GC 트리거:**

- Worker 동일 실수 2회 이상 반복
- GATE 차단 패턴 발생
- 사용자 수정 요구
- 프로젝트 Phase 전환 (정기 점검)

---
