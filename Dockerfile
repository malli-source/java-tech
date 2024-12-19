FROM openjdk
COPY target/*.jar /app/app.jar
ENTRYPOINT ['/usr/bin/java','-jar','/app/app.jar']
WORKDIR /app
EXPOSE 8081
