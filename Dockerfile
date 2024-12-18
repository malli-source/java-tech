FROM openjdk
WORKDIR /app
ADD target/first-app-1.0.jar /app
ENTRYPOINT ['/usr/bin/java','-jar','/app/first-app-1.0.jar']
EXPOSE 8081