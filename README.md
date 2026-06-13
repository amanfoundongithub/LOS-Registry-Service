# Registry Microservice

This is a light-weight microservice designed to register and on-board other 
microservices that are part of the LOS project.

## Registration Process

All the microservices are registered by using `Netflix Eureka`, which is an open
source registry library created in `Spring Boot`. 

Every microservice is required to register on this service to be recognized and used
by the Gateway for direct API reference.

For each microservice, we need to add the following:

- `build.gradle`: Add the dependency to ensure that Netflix Eureka is configured for registering
that microservice:
```groovy
implementation 'org.springframework.cloud:spring-cloud-starter-netflix-eureka-client'
```
- `application.yaml`: Ensure that the application's configuration is added so that the application 
becomes recognizable:
```yaml 
eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/
```
Also, the name mentioned in the `spring.application.name` (in capital) will be used to register the service.
For example, in the IAM microservice, we have:
```yaml
spring:
  application:
    name: iam-service 
```
So, on Eureka, it will get registered as `IAM-SERVICE`.

## Run This Project

This project can be started by using `Docker`. 

To start the server, run the following command from the root directory:

```bash 
docker-compose up --build
```

This will start the docker application on `localhost:8761`.

## How To Check

To check if service is really onboarded, you should go to the user-interface at `http://localhost:8761`. 

If
you see your application's name in that UI, and the status as `UP`, it means that the 
application has been configured and is now successfully onboarded to our service registry!

