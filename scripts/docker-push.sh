#!/bin/bash

# Docker Hub 로그인 및 이미지 푸시 스크립트
# 사용법: ./scripts/docker-push.sh [tag]

set -e  # 오류 발생 시 스크립트 중단

# 색상 코드
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Docker Hub 설정
DOCKER_USERNAME="lotusrious"
IMAGE_NAME="travel-agent-backend"
REGISTRY="docker.io"

# 태그 설정 (인자로 받거나 기본값 사용)
TAG=${1:-latest}

echo -e "${YELLOW}🐳 Docker Hub 푸시 스크립트 시작${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Docker 로그인 확인
echo -e "${YELLOW}1. Docker Hub 로그인 확인...${NC}"
if ! docker info | grep -q "Username: ${DOCKER_USERNAME}"; then
    echo -e "${YELLOW}   Docker Hub에 로그인합니다...${NC}"
    echo "$DOCKER_ACCESS_TOKEN" | docker login -u ${DOCKER_USERNAME} --password-stdin
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}   ✅ 로그인 성공${NC}"
    else
        echo -e "${RED}   ❌ 로그인 실패${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}   ✅ 이미 로그인되어 있습니다${NC}"
fi

# 이미지 빌드
echo -e "\n${YELLOW}2. Docker 이미지 빌드...${NC}"
docker build -t ${IMAGE_NAME}:${TAG} .
if [ $? -eq 0 ]; then
    echo -e "${GREEN}   ✅ 빌드 성공${NC}"
else
    echo -e "${RED}   ❌ 빌드 실패${NC}"
    exit 1
fi

# 이미지 태깅
echo -e "\n${YELLOW}3. 이미지 태깅...${NC}"
docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}

# 추가 태그 (latest와 날짜 기반)
if [ "$TAG" != "latest" ]; then
    docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:latest
fi

DATE_TAG=$(date +%Y%m%d-%H%M%S)
docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${DATE_TAG}

echo -e "${GREEN}   ✅ 태깅 완료${NC}"
echo "   - ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"
echo "   - ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${DATE_TAG}"
[ "$TAG" != "latest" ] && echo "   - ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:latest"

# 이미지 푸시
echo -e "\n${YELLOW}4. Docker Hub에 푸시...${NC}"
docker push ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}
[ "$TAG" != "latest" ] && docker push ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:latest
docker push ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${DATE_TAG}

if [ $? -eq 0 ]; then
    echo -e "${GREEN}   ✅ 푸시 성공${NC}"
else
    echo -e "${RED}   ❌ 푸시 실패${NC}"
    exit 1
fi

# 완료 메시지
echo -e "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}🎉 Docker Hub 푸시 완료!${NC}"
echo -e "\n이미지 확인: https://hub.docker.com/r/${DOCKER_USERNAME}/${IMAGE_NAME}"
echo -e "\n사용 방법:"
echo -e "  docker pull ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"
echo -e "  docker run -p 8080:8080 ${REGISTRY}/${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"