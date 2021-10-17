FROM adoptopenjdk/openjdk11:alpine-slim

ENV MAVEN_VERSION=3.8.3
    
ENV URL=https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries \
    NAME=apache-maven-${MAVEN_VERSION} \
    EXTENSION=bin.tar.gz

RUN mkdir -p /usr/share/maven/ref

RUN apk add --no-cache curl && \
    cd /usr/share && \
    curl --remote-name ${URL}/${NAME}-${EXTENSION} && \
    tar -xaf ${NAME}-${EXTENSION} -C /usr/share/maven --strip-components 1  && \
    rm -f ${NAME}-${EXTENSION} && \
    apk del --purge curl && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_CONFIG=/home/maven/.m2 \
    MAVEN_HOME=/usr/share/maven

RUN adduser -D maven

USER maven

WORKDIR /home/maven
