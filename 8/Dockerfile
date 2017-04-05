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
    dnf -y clean all

LABEL summary="Javascript runtime." \
       name="Node.js" \
       version="8.0.0" \
       Release="1" \
       description="Node.js is a platform built on V8 JavaScript Engine for easily building fast, scalable network applications." \
       vendor="Fedora Project" \
       io.k8s.description="Node.js is a platform built on V8 JavaScript Engine for easily building fast, scalable network applications." \
       io.k8s.display-name="Node.js 8.0.0" \
       io.openshift.tags="nodejs"

# Defines the location of S2I
LABEL io.openshift.s2i.scripts-url="image:///usr/local/s2i"
COPY ./.s2i/bin/ /usr/local/s2i

# Command which runs during `docker build`
#RUN /files/<some_bash_script>.sh

# EXPOSE instruction exposes port from container to host.
# Specify it during `docker run` as parameter: "-p <host_port>:<container_port>"
EXPOSE 8080

# Specify username which will be used during running container

# VOLUME instruction creates unnamed volume and mounts it to the provided path,
# you can override this behavior by mounting
# a selected host directory into container: "-v <host_directory>:<container_directory>"
#VOLUME ['/var/spool/postfix']

# Command which will start service during command `docker run`
CMD ["usage"]
