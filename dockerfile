# Use the official OpenJDK 17 image as a base
FROM eclipse-temurin:21-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar app.jar

# Expose the port your application runs on
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]