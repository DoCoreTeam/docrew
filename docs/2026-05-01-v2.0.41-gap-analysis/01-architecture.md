# Architecture — Gap Analysis Scope

## 분석 대상 계층

```
DOMANGCHA v2.0.41
├── 1. 버전 동기화 계층 (10개 파일)
│   ├── domangcha/VERSION
│   ├── package.json
│   ├── domangcha/CLAUDE.md
│   ├── CLAUDE.md (root)
│   ├── ~/.claude/CLAUDE.md
│   ├── skills/ceo-system/SKILL.md
│   ├── skills/ceo-core/SKILL.md
│   ├── skills/ceo-sprint/SKILL.md
│   ├── skills/ceo-standards/SKILL.md
│   └── README.md
│
├── 2. §6 전파 계층
│   ├── domangcha/CLAUDE.md → §6 정의
│   ├── CLAUDE.md (root) → §6 정의
│   ├── ~/.claude/CLAUDE.md → §6 정의
│   ├── domangcha/commands/ceo.md → GATE 2 + EXEC 패턴
│   ├── domangcha/error-registry.md → EXEC-001~004
│   └── skills/ceo-standards/SKILL.md → 금지 패턴 목록
│
└── 3. 시스템 일관성 계층
    ├── commands/ceo.md ↔ skills/ceo-core/SKILL.md
    ├── 에이전트 카운트 (17개) 일관성
    ├── docs slug 컨벤션 일관성
    └── FAST PATH / FULL PIPELINE 흐름 일관성
```

## 분석 방법
- DC-ANA: 파일별 실제 내용 읽기 → 설계 명세 대조
- CEO: 갭 목록 작성 → 즉시 수정
