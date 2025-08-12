# Travel Agent Backend

여행 계획 및 AI 챗봇 기반 여행 어시스턴트 백엔드 시스템

## 🚀 프로젝트 개요

Travel Agent는 AI 기반 맞춤형 여행 계획 서비스를 제공하는 백엔드 시스템입니다.

### 주요 기능
- **AI Chat Domain**: ChatGPT 기반 여행 상담 및 추천
- **User Management**: 사용자 인증 및 프로필 관리
- **Trip Planning**: 여행 일정 계획 및 관리
- **Review System**: 여행지 리뷰 및 평점 시스템
- **Media Management**: 이미지 및 동영상 업로드/관리
- **Payment & Billing**: 결제 처리 및 청구 관리
- **Sharing Domain**: 여행 계획 공유 기능
- **Recommendation Engine**: 개인화된 여행지 추천

## 👥 팀 구성

| 역할 | 담당 도메인 | API 수 | 주요 책임 |
|------|------------|--------|----------|
| **TL (팀장)** | AI Chat | 8 | 프로젝트 총괄, AI 통합 |
| **BE-1** | User Management + Sharing | 9 | 인증/인가, 인프라 |
| **BE-2** | Trip Planning | 10 | 여행 계획 로직 |
| **BE-3** | Review + Media | 10 | 리뷰 시스템, 문서화 |
| **BE-4** | Recommendation + Payment | 10 | 추천 알고리즘, 결제 |

## 🛠 기술 스택

### Backend
- **Language**: Java 17
- **Framework**: Spring Boot 3.x
- **Build Tool**: Gradle 8.5
- **Database**: PostgreSQL 15
- **Cache**: Redis 7
- **Message Queue**: RabbitMQ 3.12
- **Container**: Docker

### DevOps
- **CI/CD**: GitHub Actions
- **Container Registry**: Docker Hub
- **Monitoring**: Prometheus + Grafana
- **Security**: Trivy Scanner

## 📦 프로젝트 구조

```
travel-agent-backend/
├── .github/
│   └── workflows/
│       └── docker-publish.yml    # CI/CD 파이프라인
├── src/
│   └── main/
│       ├── java/
│       │   └── com/travelagent/
│       │       ├── ai/           # AI Chat Domain
│       │       ├── user/         # User Management
│       │       ├── trip/         # Trip Planning
│       │       ├── review/       # Review System
│       │       ├── media/        # Media Management
│       │       ├── payment/      # Payment & Billing
│       │       ├── sharing/      # Sharing Domain
│       │       └── recommendation/ # Recommendation
│       └── resources/
│           └── application.yml   # 설정 파일
├── scripts/
│   ├── docker-login.sh          # Docker Hub 로그인
│   └── docker-push.sh           # 이미지 빌드 및 푸시
├── docker-compose.yml           # 로컬 개발 환경
├── Dockerfile                   # 컨테이너 이미지 정의
└── build.gradle                # 빌드 설정
```

## 🚀 시작하기

### 사전 요구사항
- JDK 17
- Docker & Docker Compose
- Gradle 8.5+

### 로컬 개발 환경 설정

1. **저장소 클론**
```bash
git clone https://github.com/your-username/travel-agent-backend.git
cd travel-agent-backend
```

2. **환경 변수 설정**
```bash
cp .env.example .env
# .env 파일을 편집하여 필요한 값 설정
```

3. **Docker Compose로 인프라 실행**
```bash
docker-compose up -d postgres redis rabbitmq
```

4. **애플리케이션 실행**
```bash
./gradlew bootRun
```

### Docker로 실행

1. **이미지 빌드**
```bash
docker build -t travel-agent-backend .
```

2. **전체 스택 실행**
```bash
docker-compose up
```

## 🔒 GitHub Secrets 설정

CI/CD 파이프라인을 위해 다음 secrets를 설정해야 합니다:

1. GitHub 저장소로 이동
2. Settings → Secrets and variables → Actions
3. 다음 secrets 추가:

| Secret Name | Description | Value |
|------------|-------------|-------|
| `DOCKER_USERNAME` | Docker Hub 사용자명 | `lotusrious` |
| `DOCKER_PASSWORD` | Docker Hub 액세스 토큰 | Docker Hub에서 발급받은 액세스 토큰 |
| `SLACK_WEBHOOK_URL` | Slack 알림 URL (선택) | Slack에서 발급받은 Webhook URL |

## 📝 API 문서

각 도메인별 API 엔드포인트:

### AI Chat Domain (8 APIs)
- `POST /api/ai/chat` - AI 채팅
- `GET /api/ai/history` - 채팅 기록 조회
- 등...

### User Management (7 APIs)
- `POST /api/users/register` - 회원가입
- `POST /api/auth/login` - 로그인
- 등...

자세한 API 문서는 서버 실행 후 `/swagger-ui.html`에서 확인 가능합니다.

## 🔧 개발 가이드

### 브랜치 전략
- `main`: 프로덕션 배포 브랜치
- `develop`: 개발 통합 브랜치
- `feature/*`: 기능 개발 브랜치
- `hotfix/*`: 긴급 수정 브랜치

### 커밋 컨벤션
```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: 새로운 기능
- `fix`: 버그 수정
- `docs`: 문서 수정
- `style`: 코드 포맷팅
- `refactor`: 코드 리팩토링
- `test`: 테스트 추가
- `chore`: 빌드 작업

## 📊 모니터링

### 로컬 모니터링 스택
```bash
# Prometheus와 Grafana 실행
docker-compose --profile monitoring up
```

- Grafana: http://localhost:3000 (admin/admin)
- Prometheus: http://localhost:9090

## 🐳 Docker Hub

빌드된 이미지는 Docker Hub에서 사용 가능합니다:

```bash
docker pull lotusrious/travel-agent-backend:latest
```

## 📄 라이센스

This project is licensed under the MIT License.

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'feat: Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 연락처

- Project Lead: @lotusrious
- Project Link: https://github.com/your-username/travel-agent-backend