ARG VERSION=3.6.3

FROM alpine:3.14.2 as download

RUN apk add --no-cache curl

ENV URL=https://downloads.apache.org/maven/maven-3/{VERSION}/binaries/

ENV FILENAME=apache-maven-{VERSION}-bin.tar.gz

WORKDIR /download

RUN curl --remote-name ${URL}/${FILENAME} && \
    tar -xzf ${FILENAME} && \
    rm -f ${FILENAME}

FROM adoptopenjdk/openjdk11:alpine-slim

RUN mkdir -p /usr/share/maven /usr/share/maven/ref && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

COPY --from=download /download/apache-maven-{VERSION} /usr/share/maven

ENV MAVEN_HOME=/usr/share/maven

ENV MAVEN_CONFIG=/root/.m2
