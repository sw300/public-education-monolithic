FROM gradle:jdk10 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build -x test


ENTRYPOINT ["bash"]

FROM openjdk:8-jre-alpine

COPY --from=builder /home/gradle/src/build/libs/*.jar /app.jar
ENV PORT 8080

CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=${PORT}","-jar","/app.jar"]