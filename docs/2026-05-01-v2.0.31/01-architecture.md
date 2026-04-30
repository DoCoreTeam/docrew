# Architecture — PHASE 0.1 TRADEOFF CHECK (v2.0.31)

## 파이프라인 위치

```
INTENT PARSE → SIZE ASSESSMENT → [PHASE 0.1 TRADEOFF CHECK] → STACK SELECTION → Q&A → ...
                ↓ SMALL                                         ↓ MEDIUM+
            FAST PATH                               [TRADEOFF DETECTED] → 대기
                                                    [TRADEOFF CLEAR]    → Q&A 자동 진행
```

## 판단 흐름 (C안)

```
1차: 체크리스트 스캔 (CEO 자동)
  → 0개 해당: [TRADEOFF CLEAR] ✅
  → 1개+ 해당: 2차로 진입

2차: CEO 자율 판단
  → 이익 > 비용: [TRADEOFF CLEAR] ✅ + 위험 메모
  → 비용 > 이익: [TRADEOFF DETECTED] ⚠️ + 선택지 제시
```

## 영향 파일
- `domangcha/hooks/domangcha-ceo-enforcer.py` — CEO_REMINDER에 PHASE 0.1 섹션 추가
- `domangcha/commands/ceo.md` — PHASE 0.1 블록 삽입 (≤300줄 유지)
- `domangcha/CLAUDE.md` — 버전 헤더 업데이트
- `~/.claude/CLAUDE.md` — 버전 헤더 업데이트
- `domangcha/VERSION` → 2.0.31
