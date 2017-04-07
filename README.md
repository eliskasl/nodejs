# Node.js s2i
This repository contains the source for building various versions of the [node.js](https://nodejs.org/) application as a reproducible Docker image using [source-to-image](https://github.com/openshift/source-to-image). This image is port to **fedora 25** of software collections [Node.js s2i](https://github.com/sclorg/s2i-nodejs-container).

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

Go to [127.0.0.1:8080](127.0.0.1:8080) to check if everything works fine.

## Environment variables
---------------------

Application developers can use the following environment variables to configure the runtime behavior of this image:

NAME        | Description
------------|-------------
NODE_ENV    | NodeJS runtime mode (default: "production")
DEV_MODE    | When set to "true", `nodemon` will be used to automatically reload the server while you work (default: "false"). Setting `DEV_MODE` to "true" will change the `NODE_ENV` default to "development" (if not explicitly set).
NPM_RUN     | Select an alternate / custom runtime mode, defined in your `package.json` file's [`scripts`](https://docs.npmjs.com/misc/scripts) section (default: npm run "start"). These user-defined run-scripts are unavailable while `DEV_MODE` is in use.
HTTP_PROXY  | Use an npm proxy during assembly
HTTPS_PROXY | Use an npm proxy during assembly
NPM_MIRROR  | Use a custom NPM registry mirror to download packages during the build process

#### NOTE: Define your own "`DEV_MODE`":

The following `package.json` example includes a `scripts.dev` entry.  You can define your own custom [`NPM_RUN`](https://docs.npmjs.com/cli/run-script) scripts in your application's `package.json` file.

#### Note: Setting logging output verbosity
To alter the level of logs output during an `npm install` the npm_config_loglevel environment variable can be set. See [npm-config](https://docs.npmjs.com/misc/config).

## Development Mode
---------------------
This image supports development mode. This mode can be switched on and off with the environment variable `DEV_MODE`. `DEV_MODE` can either be set to `true` or `false`.
Development mode supports two features:
* Hot Deploy
* Debugging

The debug port can be specified with the environment variable `DEBUG_PORT`. `DEBUG_PORT` is only valid if `DEV_MODE=true`.

A simple example command for running the docker container in development mode is:
```
docker run --env DEV_MODE=true my-image-id
```

To run the container in development mode with a debug port of 5454, run:
```
$ docker run --env DEV_MODE=true DEBUG_PORT=5454 my-image-id
```

To run the container in production mode, run:
```
$ docker run --env DEV_MODE=false my-image-id
```

By default, `DEV_MODE` is set to `false`, and `DEBUG_PORT` is set to `5858`, however the `DEBUG_PORT` is only relevant if `DEV_MODE=true`.

Hot deploy
--------------------

As part of development mode, this image supports hot deploy. If development mode is enabled, any souce code that is changed in the running container will be immediately reflected in the running nodejs application.

### Using Docker's exec

To change your source code in a running container, use Docker's [exec](http://docker.io) command:
```
$ docker exec -it <CONTAINER_ID> /bin/bash
```
After you [Docker exec](https://docs.docker.com/engine/reference/commandline/exec/) into the running container, your current directory is set to `/opt/app-root/`, where the source code for your application is located.

## Running in OpenShift

**openshift-template.yaml** is not completed yet.
