
#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
#ADD . /home/app/
#WORKDIR /home/app/
RUN mvn -f /home/app/pom.xml clean package


#
# App Deploy
FROM openjdk:11-jre-slim
# Copy file from the build container to app container
COPY --from=build /home/app/target/echo-0.0.1-SNAPSHOT.jar /usr/local/lib/echo.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/echo.war"]
# # run the app
# CMD ["/usr/bin/java", "-jar", "/echo.war"]



