
FROM openjdk:17-jdk-alpine

WORKDIR /usr/src/app

COPY Hello.java .

RUN javac app.java

CMD ["java", "app"]
