# Completion Criteria — PHASE 0.1 TRADEOFF CHECK (v2.0.31)

## 완료 조건
1. CEO가 MEDIUM+ 요청 시 [TRADEOFF DETECTED] 또는 [TRADEOFF CLEAR] 중 하나를 반드시 출력
2. SMALL 요청 시 이 단계가 나타나지 않음
3. ceo.md ≤300줄
4. 모든 파일 버전 v2.0.31 일치
5. DC-REV PASS
6. git push + npm publish 완료

## 롤백 기준
- ceo.md가 300줄 초과하면 PHASE 0.1 섹션 축약 후 재시도
- 트레이드오프 판단이 모든 요청에 발동되면 체크리스트 기준 강화 필요
