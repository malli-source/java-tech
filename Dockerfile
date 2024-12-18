FROM openjdk
WORKDIR /app
ADD target/javatechbase-1.0.jar /app
ENTRYPOINT ['/usr/bin/java','-jar','/app/javatechbase-1.0.jar']
EXPOSE 8081