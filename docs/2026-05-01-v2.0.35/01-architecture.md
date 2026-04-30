# Architecture — DC-ANA

## 파이프라인 위치

```
MEDIUM+ 업무 진입
  ↓
PHASE 0.1: TRADEOFF CHECK
  ↓
PHASE 0.3: STACK SELECTION
  ↓
PHASE 0.5: Q&A
  ↓
PHASE 1: PLANNER
  🟦 DC-BIZ (사업 타당성)
  🟦 DC-RES (외부 리서치)
  🟦 DC-OSS (OSS 탐색)
  🟦 DC-ANA (내부 코드 탐색) ← 신규, 키워드/LARGE/HEAVY 트리거 시
  ↓
PHASE 3: GENERATOR (DC-DEV-* 병렬)
  ↓
PHASE 4: EVALUATOR
```

## DC-ANA 내부 흐름

```
CEO → DC-ANA 호출
  ↓
1. Entry Point 탐색 (Read, Grep, Glob)
2. 실행 경로 추적 (call chain 매핑)
3. 아키텍처 레이어 식별
4. 패턴/컨벤션 인식
5. 의존성 문서화
  ↓
docs/analysis-YYYY-MM-DD/00-codebase-map.md 저장
  ↓
CEO에게 요약 보고
  ↓
🟩 DC-DEV-* 가 참조하여 구현
```

## 파일 구조

```
domangcha/
├── agents/
│   ├── dc-ana.md  ← 신규
│   └── ...
```
