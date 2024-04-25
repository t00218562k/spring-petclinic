# Stage 1: Build the application
FROM maven:3.6.3-jdk-11 as builder
WORKDIR /app
COPY . .
RUN ./mvnw clean install -DskipTests

# Stage 2: Setup the runtime container
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]