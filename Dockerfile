FROM maven:3.8.4-openjdk-11-slim AS build

WORKDIR /app

COPY pom.xml .

COPY src/ /app/src/

CMD ["mvn", "spring-boot:run"]

