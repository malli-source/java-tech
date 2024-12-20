FROM openjdk:8
COPY javatechbase/target/javatechbase-1.0.jar /app/javatechbase-1.0.jar
ENTRYPOINT ['java','-jar','/app/javatechbase-1.0.jar']
WORKDIR /app
EXPOSE 8081
