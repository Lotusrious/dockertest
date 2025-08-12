# GitHub 저장소 설정 가이드

## 1. GitHub 저장소 생성

### 단계별 진행:

1. **GitHub 로그인**
   - https://github.com 접속
   - 계정 로그인

2. **새 저장소 생성**
   - 우측 상단 `+` 버튼 클릭 → `New repository` 선택
   - Repository name: `travel-agent-backend`
   - Description: "AI 기반 여행 계획 백엔드 시스템"
   - Public/Private 선택
   - **주의**: "Initialize this repository with:" 옵션들은 모두 체크 해제
   - `Create repository` 클릭

## 2. 로컬 프로젝트와 GitHub 연결

터미널에서 다음 명령어 실행:

```bash
# 현재 프로젝트 디렉토리로 이동
cd /Users/kmj/Desktop/Final

# Git 초기화
git init

# 모든 파일 추가
git add .

# 첫 커밋
git commit -m "feat: Initial commit - Travel Agent Backend setup with Docker CI/CD"

# main 브랜치로 변경 (GitHub 기본 브랜치)
git branch -M main

# GitHub 원격 저장소 추가 (YOUR_USERNAME을 실제 GitHub 사용자명으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/travel-agent-backend.git

# 첫 푸시
git push -u origin main
```

## 3. GitHub Secrets 설정 (CI/CD용)

### Docker Hub 인증 정보 설정:

1. **GitHub 저장소 페이지로 이동**
   - `https://github.com/YOUR_USERNAME/travel-agent-backend`

2. **Settings 탭 클릭**
   - 저장소 상단 메뉴에서 `Settings` 선택

3. **Secrets and variables → Actions**
   - 좌측 메뉴에서 `Secrets and variables` 클릭
   - 하위 메뉴에서 `Actions` 선택

4. **New repository secret 추가**

   **Secret 1: Docker Hub 사용자명**
   - `New repository secret` 버튼 클릭
   - Name: `DOCKER_USERNAME`
   - Secret: `lotusrious`
   - `Add secret` 클릭

   **Secret 2: Docker Hub 액세스 토큰**
   - `New repository secret` 버튼 클릭
   - Name: `DOCKER_PASSWORD`
   - Secret: Docker Hub에서 발급받은 액세스 토큰 (dckr_pat_로 시작)
   - `Add secret` 클릭

   **Secret 3: Slack Webhook (선택사항)**
   - Slack 알림을 원하는 경우만 설정
   - Name: `SLACK_WEBHOOK_URL`
   - Secret: Slack에서 발급받은 Webhook URL
   - `Add secret` 클릭

## 4. GitHub Actions 활성화 확인

1. **Actions 탭 클릭**
   - 저장소 상단 메뉴에서 `Actions` 선택

2. **Workflow 확인**
   - "Docker Build and Publish" workflow가 표시되는지 확인
   - 첫 푸시 후 자동으로 실행됨

## 5. 첫 CI/CD 파이프라인 실행

### 자동 실행:
- main 브랜치에 코드 푸시 시 자동 실행
- develop 브랜치에 코드 푸시 시 자동 실행
- v* 형식의 태그 생성 시 자동 실행

### 수동 실행:
1. Actions 탭으로 이동
2. "Docker Build and Publish" workflow 선택
3. "Run workflow" 버튼 클릭
4. Branch 선택 (main 또는 develop)
5. "Run workflow" 클릭

## 6. Docker Hub 이미지 확인

파이프라인 실행 성공 후:

1. **Docker Hub 확인**
   - https://hub.docker.com/r/lotusrious/travel-agent-backend
   - 빌드된 이미지와 태그 확인

2. **이미지 다운로드 테스트**
   ```bash
   docker pull lotusrious/travel-agent-backend:latest
   ```

## 7. 브랜치 보호 규칙 설정 (권장)

### main 브랜치 보호:

1. **Settings → Branches**
2. **Add rule** 클릭
3. **Branch name pattern**: `main`
4. **보호 규칙 선택**:
   - ✅ Require a pull request before merging
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging
   - ✅ Include administrators
5. **Create** 클릭

## 8. 협업자 추가

### 팀원 초대:

1. **Settings → Manage access**
2. **Add people** 클릭
3. GitHub 사용자명 또는 이메일로 초대
4. 권한 레벨 선택:
   - **Write**: 코드 푸시 가능
   - **Admin**: 저장소 설정 변경 가능

## 문제 해결

### Git 푸시 오류 해결:

```bash
# 인증 오류 시
git config --global user.name "YOUR_GITHUB_USERNAME"
git config --global user.email "YOUR_EMAIL@example.com"

# 원격 저장소 URL 확인
git remote -v

# URL 변경이 필요한 경우
git remote set-url origin https://github.com/YOUR_USERNAME/travel-agent-backend.git
```

### GitHub Actions 실패 시:

1. Actions 탭에서 실패한 workflow 클릭
2. 오류 로그 확인
3. 주요 체크 포인트:
   - Secrets 올바르게 설정되었는지 확인
   - Dockerfile이 존재하는지 확인
   - build.gradle 파일이 있는지 확인

### Docker Hub 연결 실패 시:

1. Secrets의 `DOCKER_PASSWORD`가 올바른지 확인
2. Docker Hub 액세스 토큰이 만료되지 않았는지 확인
3. Docker Hub 계정이 활성화되어 있는지 확인

## 다음 단계

✅ GitHub 저장소 생성 완료
✅ Secrets 설정 완료
✅ CI/CD 파이프라인 실행 확인
✅ Docker Hub 이미지 확인

이제 팀원들과 협업을 시작할 준비가 완료되었습니다!