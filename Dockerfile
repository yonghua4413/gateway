# jdk8
FROM openjdk:8-jdk-alpine

# 复制项目
COPY target/hdg-apis-gateway-server-0.0.1-SNAPSHOT.jar /service/app.jar
COPY src/main/resources/application.yml /service/config/application.yml

WORKDIR /service

# 这里的端口与jar包运行端口一致（不写也可以，创建容器时自己记住就行，推荐填写）
EXPOSE 8080

CMD ["java", "-jar", "app.jar"]