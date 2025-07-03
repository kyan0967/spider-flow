FROM maven:3.8.7-eclipse-temurin-8

WORKDIR /app
COPY . .

# 打包并列出 target 文件内容
RUN mvn clean package -Dmaven.test.skip=true \
 && ls -al spider-flow-web/target \
 && cp spider-flow-web/target/spider-flow-web-*.jar spider-flow.jar

ENV PORT=8080
EXPOSE 8080

# 启动时使用已重命名的 jar
CMD java -Dserver.port=$PORT -jar spider-flow.jar
