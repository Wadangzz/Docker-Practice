FROM alpine:latest

# Pocketbase 최선버전
ARG PB_VERSION=0.30.0
# 필수 패키지 설치
RUN apk add --no-cache unzip ca-certificates curl tzdata && update-ca-certificates

# 환경 변수 설정
ENV TZ=Asia/Seoul POCKETBASE_DIR=/pb

# 다운로드 및 압축 해제
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir", "/pb/pb_data", "--publicDir", "/pb/pb_public"]