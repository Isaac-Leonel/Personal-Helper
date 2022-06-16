FROM openjdk:11
COPY ./target/*.jar elderly.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "elderly.jar"]