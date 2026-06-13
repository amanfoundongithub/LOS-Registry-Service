FROM gradle:9.5-jdk21 AS builder
WORKDIR /app
COPY . .
# Compile and package into a bootable JAR, skipping test execution
RUN ./gradlew bootJar -x test

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "app.jar"]