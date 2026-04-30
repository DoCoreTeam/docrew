# Requirements — DC-ANA 신규 에이전트 추가

## 기능 요구사항

### F1. DC-ANA 에이전트 정의
- 🟦 PLANNER 그룹 소속, Sonnet 모델
- subagent_type: `dc-ana`
- ECC code-explorer의 모든 기능 흡수 (실행 경로 추적, 아키텍처 매핑, 의존성 분석)
- 출력: `docs/analysis-YYYY-MM-DD/00-codebase-map.md` 저장

### F2. 트리거 조건 정의
- 키워드 감지: "갭분석", "현황 파악", "리팩터링", "아키텍처 분석", "어떻게 동작", "코드 구조", "의존성"
- 규모 조건: LARGE / HEAVY → 자동 소환
- MEDIUM + 키워드 없음 → CEO 판단

### F3. code-explorer 대체 선언
- 모든 파이프라인에서 code-explorer 호출 금지 규칙 추가
- DC-ANA가 유일한 코드베이스 탐색 담당

### F4. 로스터 업데이트
- PLANNER 그룹: DC-BIZ · DC-RES · DC-OSS · DC-ANA (4명)
- 에이전트 총계: 17명
- 모든 참조 파일 동기화

## 비기능 요구사항
- 기존 16개 DC-* 에이전트 동작 변경 없음
- 버전: 2.0.35 (PATCH)
