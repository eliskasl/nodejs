# Node.js s2i
This repository contains the source for building various versions of the [node.js](https://nodejs.org/) application as a reproducible Docker image using [source-to-image](https://github.com/openshift/source-to-image). Image is based on **fedora 25**.

## Build
Build image with **Makefile**

### Version 6
```
# node.js version 6
$ make build-6
```

### Version 8
```
# node.js version 8
$ make build-8
```

## Usage

Build your node.js application
```
$ s2i build <SOURCE-REPOSITORY> nodejs:<VERSION> <NAME-OF-APP>
```
Substitute \<SOURCE-REPOSITORY\> with path to your application or link to GitHub repository.

Run your application in docker container.

```
$ docker run -p 8080:8080 <NAME-OF-APP>
```

Go to [0.0.0.0:8080](0.0.0.0:8080) to check if everything works fine.

## Running in OpenShift

**openshift-template.yaml** is not completed yet.
