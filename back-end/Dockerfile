FROM openjdk
RUN sudo apt update
COPY . . (should be compiled)
EXPOSE 9966
ENTRYPOINT ["./mvnw", "spring-boot:run"]
