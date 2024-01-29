FROM maven:3.8.4-openjdk-11-slim AS build

WORKDIR /app

COPY pom.xml .

COPY src/ /app/src/

EXPOSE 8080

CMD ["mvn", "spring-boot:run"]

