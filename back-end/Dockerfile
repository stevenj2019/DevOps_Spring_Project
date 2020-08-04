FROM openjdk
WORKDIR /app 
COPY . /app
EXPOSE 9966
RUN chmod +x mvnw
ENTRYPOINT ["./mvnw", "spring-boot:run"]
