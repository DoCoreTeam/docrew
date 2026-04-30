# Test Strategy — DC-ANA

## 검증 항목
1. `Agent(subagent_type="dc-ana")` 호출 시 정상 동작 확인
2. dc-ana.md frontmatter name 필드 = "dc-ana"
3. 로스터 파일들에 DC-ANA 일관되게 반영됐는지 grep 검증
4. code-explorer 참조가 DOMANGCHA 파일에서 제거됐는지 확인
5. 버전 일관성 (VERSION, package.json, 모든 CLAUDE.md, SKILL.md, README)

## 검증 방법
- grep 기반 자동 확인 (🟥 DC-REV 수행)
