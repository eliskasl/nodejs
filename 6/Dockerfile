FROM fedora:25

# Provide some Dockerfile description, like is mentioned below
# Volumes:
#  * /var/spool/postfix -
#  * /var/log/postfix - Postfix log directory
# Environment:
#  * $MYHOSTNAME - Hostname for Postfix image
# Exposed ports:
# * 10025 - Unprivileged port used by postfix
# Additional packages
#  * findutils are needed in case fedora:24 is loaded from docker.io.

RUN dnf install -y --setopt=tsflags=nodocs nodejs npm && \
    dnf install -y --setopt=tsflags=nodocs findutils && \
    dnf -y clean all

LABEL summary="Javascript runtime." \
       name="Node.js" \
       version="6.10.1" \
       Release="1" \
       description="Node.js is a platform built on V8 JavaScript Engine for easily building fast, scalable network applications." \
       vendor="Fedora Project" \
       io.k8s.description="Node.js is a platform built on V8 JavaScript Engine for easily building fast, scalable network applications." \
       io.k8s.display-name="Node.js 6.10.1" \
       io.openshift.tags="nodejs"

# Defines the location of S2I
LABEL io.openshift.s2i.scripts-url="image:///usr/local/s2i"
COPY ./.s2i/bin/ /usr/local/s2i

# set enviroment variables
# add path to npm binaries to PATH
ENV HOME_APP_ROOT=/opt/app-root \
    NPM_RUN=start \
    PATH=/opt/app-root/node_modules/.bin/:/opt/app-root/.npm-global/bin/:$PATH

# create home directory and system user with UID 1001 GID 0 and default name
# set user home directory to $HOME_APP_ROOT
RUN mkdir -p ${HOME_APP_ROOT} && \
    useradd -u 1001 -r -g 0 -d ${HOME_APP_ROOT} -s /sbin/nologin \
    -c "Default user" default

# EXPOSE instruction exposes port from container to host.
# Specify it during `docker run` as parameter: "-p <host_port>:<container_port>"
EXPOSE 8080

# drop the root user and make content of /opt/app-root owned by user 1001
RUN chown -R 1001:0 /opt/app-root && \
    find ${HOME_APP_ROOT} -type d -exec chmod g+ws {} \;

# Default user for image
USER 1001

WORKDIR ${HOME_APP_ROOT}

# VOLUME instruction creates unnamed volume and mounts it to the provided path,
# you can override this behavior by mounting
# a selected host directory into container: "-v <host_directory>:<container_directory>"
#VOLUME ['/var/spool/postfix']

# Command which will start service during command `docker run`
CMD ["usage"]
