FROM eclipse-temurin:8-jdk

MAINTAINER octopus

# 创建工作目录
RUN mkdir -p /spider-flow
WORKDIR /spider-flow

# 复制整个项目源代码
COPY . .

# 构建项目（跳过测试）
RUN ./mvnw clean package -Dmaven.test.skip=true

# Render 要求监听 $PORT（默认 8080）
ENV PORT=8080
EXPOSE 8080

# 启动 spider-flow（确保文件名正确）
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=$PORT", "-jar", "spider-flow-web/target/spider-flow-web-0.3.5.jar"]
