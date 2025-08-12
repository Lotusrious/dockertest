#!/bin/bash

# Docker Hub 안전한 로그인 스크립트
# 액세스 토큰을 환경변수로 설정하여 사용

set -e

# 색상 코드
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Docker Hub 정보
# 실제 사용 시 .env 파일에서 읽어오거나 환경변수로 설정
DOCKER_USERNAME="${DOCKER_USERNAME:-lotusrious}"
DOCKER_ACCESS_TOKEN="${DOCKER_ACCESS_TOKEN:-your-docker-access-token}"

echo -e "${YELLOW}🔐 Docker Hub 로그인${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 로그인 시도
echo -e "${YELLOW}Docker Hub에 로그인 중...${NC}"
echo "${DOCKER_ACCESS_TOKEN}" | docker login -u ${DOCKER_USERNAME} --password-stdin

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 로그인 성공!${NC}"
    echo -e "\n로그인 정보:"
    docker info | grep -E "Username|Registry"
    
    echo -e "\n${YELLOW}다음 명령어로 이미지를 푸시할 수 있습니다:${NC}"
    echo "  docker build -t ${DOCKER_USERNAME}/travel-agent-backend:latest ."
    echo "  docker push ${DOCKER_USERNAME}/travel-agent-backend:latest"
else
    echo -e "${RED}❌ 로그인 실패${NC}"
    exit 1
fi