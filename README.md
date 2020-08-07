# DevOps_Spring_Project

## Repositories 

+ [Front-end](https://github.com/spring-petclinic/spring-petclinic-angular)
+ [Back-end](https://github.com/spring-petclinic/spring-petclinic-rest)

## Resources
+ [Trello](https://trello.com/b/iionyJG6/final-project)
+ [Risk Assestment](https://docs.google.com/spreadsheets/d/1e9dNWcu6ro9YcTkmCDNhyVzRHGwjEr3RxXqMkqxVKZE/edit#gid=0)

## Technologies 
+ angular.js 
+ Spring
+ maven 
+ Jenkins 
+ Karma + e2e
+ Docker 
+ Terraform 
+ Kubernetes

## CI Pipeline

 ![CI_Pipeline](https://imagizer.imageshack.com/img924/5483/RfIR55.png)

## Jenkins Server Configuration 

Install via script:
```console
user@server:~$ sudo bash tools/CI-server-setup.sh
```

## Application Build 

Front end build done using Angular CLI 

```console
user@server:~$ cd back-end
user@server:~$ ./mvnw spring-boot:run
```

This file will also be integrated into our Pipeline job

Back end build has been done using Maven 

```console
user@server:~$ cd front-end
user@server:~$ ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
user@server:~$ compodoc -p src/tsconfig.app.json -d docs
```
## Docker 

Dockerfiles and Docker-Compose is use to build our images. However it is not used to Deployment

## Infrastructure 

### Infrasturcture Diagram 
![Infra-Diagram](https://imagizer.imageshack.com/img923/5626/piEWWK.png)

### Kubernetes
Initial launch commands:
 
```console
user@server:~$ kubectl apply -f mysql.yaml
user@server:~$ kubectl apply -f backend.yaml
user@server:~$ kubectl apply -f frontend.yaml
```
### Pricing 

Estimated Costs = £95.58 

To save Money we could consider: 
+ Reserved Vm Instance (up to 72%)
+ Consult Sales
+ Lower VM tier (could cause stability issues)
