# Jira 워크플로우(애자일 운영)

## 이슈 타입
- Epic: 큰 비즈니스 목표(예: Auth MVP)
- Story: 사용자 가치 단위(예: 로그인)
- Task: 구현 작업(예: JWT 필터 추가)
- Bug: 결함
- Sub-task: PR 단위 분해 작업

## 워크플로우 상태
- Backlog → Selected for Dev → In Progress → In Review → QA/Verification → Done
- Blocked: 별도 라벨로 표시, 원인/의존성 명시

## 보드 정책
- 칸반 WIP 제한: In Progress(각자 최대 2), In Review(팀 최대 5)
- 우선순위: High/Medium/Low 라벨

## 추정/속도
- Story Point: 1(작음)·3(중간)·5(큼)
- 주 단위 속도 추적, 회고에서 보정

## 정의
- DoR(Ready): 수용 기준, 스코프 In/Out, 설계 메모, 테스트 노트 있음
- DoD(Done): PR 머지, 테스트/빌드 통과, Swagger/문서 갱신, 릴리즈 노트 반영

## 브랜치/커밋 규칙
- 브랜치: feature/JIRA-123-short, fix/JIRA-234-issue
- 커밋: JIRA-123: 요약
- Smart Commit: JIRA-123 #comment 내용 #time 1h #transition In Review

## 링크/통합
- PR 제목에 JIRA-123 포함, PR 머지 시 자동 전이(자동화 사용 시)
- 스프린트: 1주 단위, 금요일 데모/회고

## 회의 루틴(리마인드)
- 09:20 스탠드업, 09:35 트리아지, 17:00 마감 블록 리뷰/문서 정리

