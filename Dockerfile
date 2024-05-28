# Use Java 17 as the base image
FROM eclipse-temurin:17-jre-alpine
# Set the working directory inside the container
WORKDIR /app

# Copy the packaged jar file into the container at /app
COPY build/libs/spk8s-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your application runs on
EXPOSE 8080
# Specify the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]