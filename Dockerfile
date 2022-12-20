# First stage: complete build environment
FROM maven:3.5.0-jdk-8-alpine AS builder
# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/
# package jar
RUN mvn clean package -DskipTests

#second stage: build image
FROM openjdk:8-jdk-alpine
COPY --from=builder target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
