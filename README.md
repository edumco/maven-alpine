# Maven Alpine

Maven images running on Alpine Linux to acellerate build times on Java projects.

## Usage

### The easy way

You can pull the built images directly

```shell
docker pull ghcr.io/edumco/maven-alpine:jdk17
```

Than you can mount your java project folder on run 

```shell
docker run -it --mount type=bind,source=/myproject,target=/home/maven ghcr.io/edumco/maven-alpine:jdk16
```

And finnaly run your maven commands

```shell
mvn test
```

### The pro way

Clone or download this repo and build your own image modifying it to your needs.

### The SUPER HYPER MEGA AWSOMWE WAY

Fork this project and help make this become a even usefull repo

## Why another image

Until the creation of this repo the Alpine linux project does not have a JDK16 nor the Maven provides an official container image based on Alpine Linux.

## License

[![MIT](https://img.shields.io/github/license/edumco/maven-alpine-openjdk)](https://github.com/edumco/maven-alpine-openjdk/)
