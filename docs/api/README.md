# Swagger/OpenAPI 운영 가이드

## 위치/버전
- 스키마: docs/api/openapi.yml (소스 오브 트루스)
- 버전: info.version 증가(브레이킹 변경 시 마이너/메이저)

## 작성 규칙
- 태그: 모듈 단위(Auth, Users, Trips ...)
- 보안: bearerAuth 전역, 엔드포인트별 override 가능
- 에러: ErrorResponse(code/message/details) 사용
- 페이지네이션: size 상한, cursor(keyset) 명시
- 예시: request/response 예시 반드시 포함
- 네이밍: camelCase, enum은 UPPER_SNAKE

## 변경 프로세스
- PR에서 openapi.yml 변경 필수(엔드포인트 추가/변경 시)
- 샘플 응답/에러 케이스 동반
- 머지 후 Swagger UI에서 검증

## 스프링 연동(가이드)
- springdoc-openapi 사용 권장
- /swagger-ui.html 노출, 프로덕션은 보호

## 문서 릴리즈 노트
- 문서 담당자가 주 2회 변경 요약을 CHANGELOG에 반영

