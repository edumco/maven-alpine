FROM adoptopenjdk/openjdk11:alpine-slim

ENV MAVEN_VERSION=3.8.3 \
    URL=https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/ \
    FILENAME=apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    MAVEN_CONFIG=/root/.m2 \
    MAVEN_HOME=/usr/share/maven

RUN mkdir -p /usr/share/maven && \
    mkdir -p /usr/share/maven/ref

WORKDIR /usr/share/maven

RUN apk add --no-cache curl && \
    curl --remote-name ${URL}/${FILENAME} && \
    tar -xzf ${FILENAME} && \
    rm -f ${FILENAME} && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    apk del --purge curl
