ARG DEV_JDK=amazoncorretto-17
ARG RUNTIME_JDK=temurin-17-jdk

### Compile Stage (platform-agnostic)
FROM --platform=$BUILDPLATFORM maven:3.9.4-$DEV_JDK AS compile

RUN yum -y update && yum -y install git && yum clean all

# ... rest unchanged ...

### Development Stage
FROM maven:3.9.4-$DEV_JDK AS dev

RUN yum -y update && yum -y install tar gzip git && yum clean all

# ... rest unchanged ...

### Production Stage
FROM tomcat:9.0.78-jdk17-temurin

RUN yum -y update && yum clean all && rm -rf /usr/local/tomcat/webapps/*

# ... rest unchanged ...
