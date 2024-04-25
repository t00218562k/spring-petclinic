FROM maven:3.8.6-openjdk-11 as builder
WORKDIR /app
COPY . .
RUN ./mvnw clean install -DskipTests



FROM eclipse-temurin:21-jre
COPY --from=builder /app/target/*.jar /app/spring-petclinic.jar
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]