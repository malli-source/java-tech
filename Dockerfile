FROM openjdk
COPY {{JAR_FILE_PATH}} /app/app.jar
ENTRYPOINT ['/usr/bin/java','-jar','/app/app.jar']
WORKDIR /app
EXPOSE 8081
