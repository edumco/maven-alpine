FROM alpine:3.14.0 as download

RUN apk add --no-cache curl

ENV URL=https://downloads.apache.org/maven/maven-3/3.6.3/binaries/

ENV FILENAME=apache-maven-3.6.3-bin.tar.gz

WORKDIR /download

RUN curl --remote-name ${URL}/${FILENAME} && \
    tar -xzf ${FILENAME} && \
    rm -f ${FILENAME}

FROM adoptopenjdk/openjdk11:alpine-slim

RUN mkdir -p /usr/share/maven /usr/share/maven/ref && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

COPY --from=download /download/apache-maven-3.6.3 /usr/share/maven

ENV MAVEN_HOME=/usr/share/maven

ENV MAVEN_CONFIG=/root/.m2
