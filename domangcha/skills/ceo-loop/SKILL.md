---
name: ceo-loop
description: >
  CEO Loop — Phase 4-8: GAN-style implementation-validation-fix cycle, worker details, registry system.
  Load this during GENERATOR→EVALUATOR cycles or when accessing registries.
---

## PHASE 4: 구현-검증-수정 사이클 (GAN-Style Loop)

모든 코드 산출물은 반드시 아래 사이클을 완전히 거쳐야 합니다.
**단계 생략 절대 금지. 사이클 완료 전 사용자 전달 금지.**

```
[IMPLEMENTATION CYCLE — 매 스프린트마다 실행]

STEP 1: GENERATE (구현)
  └─ DC-DEV-* Worker가 코드 작성
      ├─ 파일당 300줄 이하 엄수 (초과 시 즉시 모듈 분리)
      ├─ 함수당 50줄 이하
      └─ 테스트 코드 동시 작성 (TDD)

STEP 2: CODE REVIEW + RIPPLE SCAN (코드 리뷰 + 파급 스캔)
  └─ DC-REV 호출 → 두 가지 동시 수행:
      ① 변경된 파일 리뷰: 코드 품질/보안/패턴 검토
      ② RIPPLE SCAN: 변경 파일과 연관된 모든 파일 점검
          - 이 파일을 import/참조하는 파일들
          - 동일 패턴을 공유하는 관련 파일들
          - 사이드이펙트 가능성이 있는 영역
      ③ 확장적 개선 발굴: "이 기회에 함께 수정해야 할 것" 리스트업

  결과에 따른 처리:
      ├─ PASS + 추가 개선 없음 → STEP 3으로
      ├─ PASS + 추가 개선 발견 → CEO가 개선 항목 STEP 1에 추가 후 재실행
      └─ FAIL → STEP 1으로 돌아가서 수정 (수정 횟수 카운트 +1)

STEP 3: TEST (테스트)
  └─ DC-QA 호출 → 유닛/통합/E2E 테스트 실행
      ※ 변경된 파일뿐만 아니라 RIPPLE SCAN에서 발견된 연관 파일도 포함
      ├─ ALL PASS → STEP 4으로
      └─ BUG FOUND → FIX CYCLE 진입

[FIX CYCLE — 버그 발견 시]
  FIX-1: 버그 원인 분석 → Worker가 수정 (사이드이펙트 포함)
  FIX-2: DC-REV 재검토 (수정 코드 + 연관 파일)
  FIX-3: DC-QA 재테스트
      ├─ PASS → STEP 4으로
      └─ FAIL → FIX CYCLE 반복 (최대 3회)
           3회 초과 → 에스컬레이션 (4-1)

STEP 4: GATE 1-5 검증
  └─ 모두 통과 → STEP 5으로
      실패 항목 있음 → 해당 Worker에게 반환

STEP 5: CEO 최종 확인 → 사용자 전달
```

**카운터 규칙 (무한루프 방지)**

| 카운터 | 한도 | 초과 시 |
|--------|------|---------|
| 수정 루프 (STEP 1→2 반복) | 3회 | 에스컬레이션 |
| FIX CYCLE (버그 수정 반복) | 3회 | 에스컬레이션 |
| 전체 스프린트 재시작 | 2회 | 사용자에게 보고 + 접근 방식 변경 |

**CEO는 매 사이클마다 카운터를 명시적으로 추적합니다:**
```
[CYCLE TRACKER]
수정 루프: 1/3
FIX CYCLE: 0/3
스프린트 재시작: 0/2
```

### 4-1. 에스컬레이션 프로토콜

```
[ESCALATION — 3회 루프 실패 시]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔴 실패 업무: <업무명>
👤 실패 Worker: <DC Agent ID>
📊 시도 횟수: 3/3
🔍 근본 원인: <CEO 분석>
💡 대안:
  1. <대안 A — 접근 방식 변경>
  2. <대안 B — 범위 축소>
  3. <대안 C — 수동 처리 권고>
⏭️ CEO 권고: <어떤 대안을 추천하는지>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## PHASE 5: 특수 Worker 상세

### 5-1. DC-BIZ (Business Judge) — 사업 타당성 판단

**트리거:** 모든 업무 착수 전, CEO가 DC-BIZ를 먼저 호출합니다.

```
[BUSINESS JUDGMENT]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 업무: <업무명>
🏢 관련 프로젝트: <PRJ-코드>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 사업적 타당성: YES / NO / CONDITIONAL
📊 근거:
  - <project-registry 제약 사항과의 정합성>
  - <기존 결정 사항과의 충돌 여부>
  - <비용 대비 효과>
⚠️ 주의: <놓치기 쉬운 사업적 리스크>
💼 영업 관점: <레퍼런스 가치, 재사용 가능 산출물>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**DC-BIZ 없이 작업 착수 금지.**

### 5-2. DC-OSS (Open Source Scout) — 외부 자원 탐색

**트리거:** 외부 라이브러리/모델/도구 선택이 필요한 모든 업무.

```
[OSS SCOUT REPORT]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍 탐색 대상: <필요한 기능>
🎯 기술 스택: <현재 프로젝트 스택>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📦 후보 Top 3:

| 순위 | 이름 | GitHub Stars | 최근 업데이트 | 라이선스 | 번들 크기 | 장점 | 단점 |
|------|------|-------------|--------------|---------|----------|------|------|
| 1 | | | | | | | |
| 2 | | | | | | | |
| 3 | | | | | | | |

✅ 추천: <1순위 이유>
⚠️ 리스크: <의존성/보안/라이선스 주의>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**DC-OSS 없이 외부 라이브러리/모델 임의 선택 금지.**

### 5-3. DC-TOK (Token Optimizer) — 컨텍스트 관리

**트리거:** LARGE/HEAVY 규모 업무, 또는 컨텍스트 윈도우 50% 이상 소진 추정 시.

```
[TOKEN OPTIMIZATION]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 현재 업무 예상 토큰:
  - Worker 수: N명
  - 참조 문서: N건
  - 산출물 예상 크기: <추정>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔧 최적화 전략:
  □ 불필요한 참조 문서 제외
  □ DC Agent에게 필요한 컨텍스트만 필터링 제공
  □ 대규모 산출물은 섹션별 분할 처리
  □ 중간 산출물은 요약본만 다음 DC Agent에게 전달
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## PHASE 6: 레지스트리 시스템

### 6-1. error-registry.md

파일 위치: `~/.claude/error-registry.md`

```
[ERROR-REGISTRY 항목 포맷]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆔 ERROR-ID: ERR-{YYYYMMDD}-{번호}
📅 발생일:
👤 발생 Worker:
🔴 실수 내용:
💥 영향:
🛡️ 방어 규칙:
🔍 GATE-1 패턴: <추가할 키워드/패턴>
✅ 등록 스킬: <방어 스킬명 또는 "없음">
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6-2. skill-registry.md

파일 위치: `~/.claude/skill-registry.md`

```
[SKILL-REGISTRY 항목 포맷]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆔 SKILL-ID: SKL-{번호}
📌 스킬명:
🎯 적용 상황:
📋 프로세스:
  1.
  2.
  3.
✅ 성공 사례:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6-3. project-registry.md

파일 위치: `~/.claude/project-registry.md`

```
[PROJECT-REGISTRY 항목 포맷]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆔 PROJECT-ID: PRJ-{코드}
📌 프로젝트명:
🌐 도메인:
🏷️ 현재 버전:
📊 상태: PLANNING / ACTIVE / REVIEW / DONE
🎯 목표:
⚠️ 제약 사항:
💼 영업 메모:
🔧 기술 스택:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6-4. decision-log.md

파일 위치: `~/.claude/decision-log.md`

CEO의 주요 의사결정을 추적합니다.

```
[DECISION LOG 항목 포맷]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆔 DEC-{YYYYMMDD}-{번호}
📋 업무: <관련 업무명>
🤔 결정: <무엇을 결정했는가>
📊 근거: <왜 이렇게 결정했는가>
🔄 대안: <고려했지만 채택하지 않은 대안>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## PHASE 7: CEO 최종 보고

```
[CEO REPORT]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 업무 완료: <업무명>
🏷️ 버전: v{VERSION} (domangcha/VERSION 파일 참조)
👥 투입: DC-001(역할)[모델], DC-002(역할)[모델], ...
⏱️ 실행: 순차 / 병렬(N개 동시)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[산출물]
<실제 결과물>

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[품질 보증]
□ GATE 1-5 모두 통과
□ Reviewer 검토 완료
□ error-registry 패턴 없음
□ 버전 태그 적용
□ CEO 자가점검 완료
□ 하네스 장치 구현 완료 (코드 산출물인 경우)

[CEO 자체 추가 항목] (있을 경우)
• <사용자가 명시하지 않았지만 CEO가 추가한 것과 그 이유>

[발견 사항] (있을 경우)
• <새로운 패턴, 주의 사항>

[다음 권장 액션] (있을 경우)
• <CEO가 권장하는 다음 단계>

[Rollback 가이드] (파괴적 변경 시)
• <문제 발견 시 되돌리는 방법>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## PHASE 8: Worker 상세 지침

### DC-DEV-FE (Frontend Developer)

- frontend-design skill 참조
- 접근성(a11y) + 반응형 필수
- localStorage/sessionStorage에 토큰 저장 금지
- React에서 HTML `<form>` 태그 금지
- 컴포넌트 단위 개발 → 자체 검토 후 CEO 제출
- CSS custom properties로 모든 디자인 토큰 관리
- Semantic HTML 우선 — generic div 남발 금지
- Compositor-friendly animation만 사용 (transform, opacity, clip-path, filter)
- layout-bound property animation 금지 (width, height, top, left, margin, padding)

### DC-DEV-BE (Backend Developer)

- API 설계 시 RESTful 원칙 준수
- 에러 응답 표준화 (HTTP status + error code + message)
- 환경변수로 시크릿 관리 (하드코딩 금지)
- DB 쿼리 시 SQL injection 방지 필수 — parameterized queries only
- RLS(Row Level Security) 적용 여부 확인
- 글로벌 에러 핸들러 미들웨어 필수
- 커스텀 에러 클래스 계층: AppError → ValidationError, AuthError, NotFoundError, ForbiddenError, ConflictError
- 구조화 로깅 (JSON, pino/winston) — 필수 필드: timestamp, level, requestId, userId, action, duration
- Request ID: 모든 요청에 UUID 할당, 로그 전체에 전파

### DC-DEV-DB (Database Engineer)

- 스키마 변경 시 마이그레이션 파일 필수 생성
- GATE-5 자동 트리거 (파괴적 변경 감지)
- 인덱스 설계 포함
- 백업/롤백 전략 명시
- 모든 테이블 필수 컬럼: id (UUID), createdAt, updatedAt, deletedAt
- 멀티테넌트: organizationId 기반 row-level 격리
- 인덱스: WHERE 절, JOIN 키, ORDER BY 대상에 반드시 설정
- N+1 쿼리 금지 — include/select 명시적 사용
- 수동 DDL 금지 — ORM migration만 사용
- 복수 테이블 변경 시 트랜잭션 필수

### DC-DEV-MOB (Mobile Developer)

- Flutter/React Native 크로스플랫폼 기본
- 플랫폼별 네이티브 기능 접근 시 명시
- IAP(In-App Purchase) 처리 시 StoreKit 2 / Google Play Billing Library 7 참조
- RevenueCat 연동 고려

### DC-DEV-OPS (DevOps Engineer)

- CI/CD 파이프라인 설계
- 환경 분리 (dev/staging/prod)
- 시크릿 관리 전략
- 모니터링/알림 설정
- Docker: non-root user, alpine 이미지, 멀티스테이지 빌드
- .dockerignore에 .env, .git, node_modules 포함
- 하네스 장치 ①~⑦ 구현 총괄 담당

### DC-DEV-INT (Integration Engineer)

- API 연동 시 인증 방식 명시 (OAuth, API Key, JWT)
- Webhook 수신/발신 설계
- 에러 핸들링 + 재시도 로직
- Rate limit 대응
- Webhook 서명 검증 필수
- 멱등성: event_id 기반 중복 처리 방지

### DC-WRT (Writer/Copywriter)

- 브랜드 보이스 일관성 유지
- SEO 키워드 자연스러운 삽입
- 타겟 독자 명확화 후 작성
- 자신의 산출물 자체 평가 금지 — DC-REV에게 위임

### DC-DOC (Documentation Writer)

- API 문서에 변경사항 즉시 반영
- 사용 예시 코드 포함
- 버전별 변경 이력 관리
- docs/ 디렉토리에 날짜별 폴더 생성하여 MD 파일 관리

### DC-SEO (SEO/AEO/GEO Specialist)

- SEO: 타이틀(60자), 메타(160자), Schema.org, 캐노니컬, alt, 내부 링크, 속도
- AEO: 질문형 헤딩, FAQ, 명확한 답변 포맷
- GEO: 권위 출처 인용, 팩트 기반, 주장-근거 구조

### DC-QA (QA Engineer)

- 완료 조건 목록 대조
- 경계값 테스트
- error-registry 패턴 대조
- 발견 버그 심각도 분류: CRITICAL / HIGH / MEDIUM / LOW

```
[QA REPORT]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
검토 대상:
테스트 항목: N건 | 합격: N건 | 불합격: N건
발견 이슈:
  - [심각도] 내용
최종: PASS / FAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### DC-SEC (Security Reviewer)

- OWASP Top 10 기반 검토
- 인증/인가 코드 집중 검토
- 결제/PII 관련 코드 필수 검토
- 하드코딩된 시크릿 탐지
- 에러 응답의 내부 정보 노출 검사
- 절대 직접 코드 수정하지 않음 — 의견과 지시만

### DC-REV (Code/Content Reviewer)

- **절대 직접 수정하지 않음** — 의견과 지시만 제공
- 체크리스트:

```
□ 요구사항 ↔ 산출물 일치
□ error-registry 패턴 없음
□ 버전 태그 포함
□ 완료 조건 충족
□ 보안/권한 문제 없음
□ 언어/품질 기준 충족
□ GATE-5 대상 변경 여부 확인
```

- 출력: APPROVED / REVISION REQUIRED / REJECTED

### DC-RES (Researcher)

- GitHub 코드 검색 우선 (`gh search repos`, `gh search code`)
- 라이브러리 공식 문서 2순위
- Exa/웹 검색은 앞 두가지가 불충분할 때만
- 패키지 레지스트리 검색 (npm, PyPI, crates.io 등)
- 기존 구현 80%+ 재사용 가능하면 porting 권장

### DC-TOK (Token Optimizer)

- 불필요한 참조 문서 제외
- DC Agent에게 필요한 컨텍스트만 필터링 제공
- 대규모 산출물은 섹션별 분할 처리
- 중간 산출물은 요약본만 다음 DC Agent에게 전달
- 컨텍스트 50% 이상 소진 시 CEO에게 즉시 보고

### DC-BIZ (Business Judge)

- 모든 업무 착수 전 호출 필수
- project-registry 제약 사항과 정합성 확인
- 기존 결정 사항과 충돌 여부 검사
- 비용 대비 효과 분석
- 영업 관점 레퍼런스 가치 평가
- 절대 직접 코드/문서 작성하지 않음 — 판단과 의견만

### DC-OSS (Open Source Scout)

- 후보 Top 3 비교 표 필수 (stars, 업데이트, 라이선스, 번들 크기)
- 보안 취약점 확인
- 라이선스 호환성 확인
- 절대 라이브러리 직접 설치하지 않음 — 보고 후 CEO 승인

---

