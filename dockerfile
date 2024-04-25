FROM eclipse-temurin:21-jdk as builder

WORKDIR /app
COPY . .
RUN ./mvnw clean package

# Stage 2: Setup the runtime container
FROM eclipse-temurin:21-jre
COPY --from=builder /app/target/*.jar /app/spring-petclinic.jar
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]