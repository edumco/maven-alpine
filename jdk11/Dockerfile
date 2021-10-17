FROM adoptopenjdk/openjdk11:alpine-slim

ENV MAVEN_CONFIG=/root/.m2

RUN mkdir -p /usr/share/maven
ENV MAVEN_HOME=/usr/share/maven
WORKDIR /usr/share/maven

ENV MAVEN_VERSION=3.8.3
ENV URL=https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/
ENV FILENAME=apache-maven-${MAVEN_VERSION}-bin.tar.gz

RUN apk add --no-cache curl && \
    curl --remote-name ${URL}/${FILENAME} && \
    tar -xzf ${FILENAME} && \
    rm -f ${FILENAME} && \
    apk del --purge curl
    
RUN mkdir -p /usr/share/maven/ref && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
 
