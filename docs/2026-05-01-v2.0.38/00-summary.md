# FAST PATH Summary
작업: install.sh memory sync를 Step 5로 이동 (Playwright/git-hooks 실패에 의한 skip 방지) + rule_grand_principles.md 템플릿 생성 + ceo-update.md 테이블에 memory 항목 추가
대상: domangcha/install.sh, domangcha/memory-templates/rule_grand_principles.md, domangcha/commands/ceo-update.md
이유: set -euo pipefail + Playwright/git-hooks 실패 시 memory sync(Step 14)가 도달 불가 → 업데이트 후 메모리 미반영. ceo-update.md 테이블에 memory 항목 없어서 사용자가 인지 불가
영향: domangcha/VERSION 2.0.37 → 2.0.38, README What's New
