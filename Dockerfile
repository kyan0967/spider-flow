# 使用带 Maven 的镜像
FROM maven:3.8.7-eclipse-temurin-8

WORKDIR /spider-flow

# 拷贝项目源码
COPY . .

# 执行打包
RUN mvn clean package -Dmaven.test.skip=true

# Render 端口设置
ENV PORT=8080
EXPOSE 8080

# 启动应用
CMD ["java", "-Dserver.port=$PORT", "-jar", "spider-flow-web/target/spider-flow-web-0.3.5.jar"]
