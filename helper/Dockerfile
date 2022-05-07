# FROM openjdk:jdk-11-alpine
# COPY /target/*.jar app
#
FROM openjdk:11
COPY . /usr/src/app
ADD target/mytask.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

