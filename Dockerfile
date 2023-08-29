# Use the official Maven image as the build environment
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project's POM file
COPY pom.xml .

# Copy the source code into the container
COPY src/ /app/src/

# Build the application and run the Spring Boot app
CMD ["mvn", "spring-boot:run"]

