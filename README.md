# a springboot api gateway project build with spring-cloud-starter-gateway

## install & build
```
git clone 
cd gateway
mvn package
docker build -t gateway .

mkdir HOST/path/config

# vi HOST/path/config/application.yml
server:
  port: 8080
spring:
  cloud:
    gateway:
      discovery:
        locator:
          enabled: true
          lower-case-service-id: true
      routes:

        # 灰度规则一
        - id: gray1
          uri: http://127.0.0.1:81
          predicates:
            - Path=/**
            - Query=gray, true

        # 灰度规则二
        - id: gray2
          uri: http://127.0.0.1:81
          predicates:
            - Path=/gray/**
          filters:
            - RewritePath=/gray/(?<segment>.*), /$\{segment}

        # 正式
        - id: master1
          uri: http://127.0.0.1:80
          predicates:
            - Path=/**
```

## run
```
docker run -itd --name gateway -p 8080:8080 -v HOST/path/config:/service/config gateway
```