# Architecture — v2.0.40 exec-rules

## 변경 구조

```
CLAUDE.md (root) ──┐
domangcha/CLAUDE.md ├── 핵심 강제 규칙 §6 "실행 신뢰성 원칙" 추가 (4개 행동)
~/.claude/CLAUDE.md ┘

domangcha/error-registry.md ── EXEC-001 ~ EXEC-004 추가

domangcha/commands/ceo.md ── GATE 2 명시적 체크리스트 강화
```

## 새 규칙 §6 구조 (CLAUDE.md 3곳 동일)

```
### 6. 실행 신뢰성 원칙 (EXECUTION INTEGRITY — 절대 금지 4개)

6-1. 미완성 완료 선언 금지
  - 구현 완료 = 04-completion-criteria.md 전 항목 ✅ 확인 후에만
  - 미완료 항목 있으면 에이전트 재작업, 완료 선언 불가

6-2. 중간 멈춤 금지
  - 구현 시작 후 "여기까지만", "다음에" 제안 절대 금지
  - 범위 분리가 필요하면 Q&A 단계에서만 사용자 승인 가능

6-3. CLI 직접 실행 원칙
  - 사용 가능한 CLI 있으면 CEO/에이전트가 직접 Bash 실행
  - 사용자 위임 허용 조건: 사용자 인증 필요 또는 로컬 전용 환경만

6-4. 세션 리포트 절대 생략 금지
  - [CEO REPORT] / [CEO FAST REPORT] 블록은 모든 작업 완료 후 필수 출력
  - 생략 시 → 즉시 규칙 위반, 리포트 재출력 후 종료
```

## GATE 2 강화

기존: "완료 조건 충족 검증"
변경 후:
```
GATE 2: 완료 조건 체크리스트 출력 (04-completion-criteria.md 라인별 ✅/❌)
  - ✅: 구현 확인됨
  - ❌: 미구현 → FAIL, 재작업 지시
  - 파일 없으면 → GATE 2 FAIL (DOC-FIRST 미실행 = 규칙 위반)
```

## error-registry 추가 패턴

| ERROR-ID | 패턴 | 대응 |
|----------|------|------|
| EXEC-001 | 구현 후 완료 선언 without 04-completion-criteria.md 확인 | GATE 2 재실행 |
| EXEC-002 | 구현 중 "다음 스프린트" / "여기까지만" 출력 | 즉시 중단, 전체 완수 요구 |
| EXEC-003 | CLI 가능 작업을 사용자에게 위임 | CEO 직접 실행으로 전환 |
| EXEC-004 | [CEO REPORT] / [CEO FAST REPORT] 블록 미출력 | 즉시 리포트 재출력 |
