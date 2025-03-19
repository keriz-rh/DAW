FROM openjdk:17-jdk-slim AS build

RUN apt-get update && apt-get install -y maven

WORKDIR /app

COPY . .

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

#######################################
FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]