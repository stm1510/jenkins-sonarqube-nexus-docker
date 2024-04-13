FROM maven:3.8.1-openjdk-11 as build
WORKDIR /app
COPY ./pom.xml ./pom.xml
COPY ./src ./src

RUN mvn clean package
FROM openjdk-11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]
