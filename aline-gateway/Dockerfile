FROM amazoncorretto:8-alpine3.16-jre
WORKDIR /root
COPY target/aline-gateway-0.0.1-SNAPSHOT.jar /root/aline-gateway-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "aline-gateway-0.0.1-SNAPSHOT.jar"]
