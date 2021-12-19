ARG JDK_IMAGE=adoptopenjdk/openjdk11:alpine-slim

FROM ${JDK_IMAGE}

LABEL org.opencontainers.image.source="https://github.com/edumco/maven-alpine"

ENV MAVEN_VERSION=3.8.4

ENV URL=https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries \
    NAME=apache-maven-${MAVEN_VERSION} \
    EXTENSION=bin.tar.gz 

RUN apk add --no-cache curl && \
    curl --remote-name ${URL}/${NAME}-${EXTENSION} && \
    mkdir -p /usr/share/maven/ref &&\
    tar -xaf ${NAME}-${EXTENSION} -C /usr/share/maven --strip-components 1  && \
    rm -f ${NAME}-${EXTENSION} && \
    apk del --purge curl && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn&& \
    adduser -D maven

ENV MAVEN_CONFIG=/home/maven/.m2 \
    MAVEN_HOME=/usr/share/maven

WORKDIR /home/maven
