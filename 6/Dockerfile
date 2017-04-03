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
       version="6.10.1" \
       Release="1" \
       description="Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications." \
       vendor="Fedora Project" \
       io.k8s.description="Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications." \
       io.k8s.display-name="Node.js 6.10.1" \
       io.openshift.tags="nodejs"

# Directive adds files from a directory (e.g. scripts) in current directory to a container directory like /files
ADD scripts /files

# Command which runs during `docker build`
#RUN /files/<some_bash_script>.sh

# EXPOSE instruction exposes port from container to host.
# Specify it during `docker run` as parameter: "-p <host_port>:<container_port>"
#EXPOSE 10025

# Specify username which will be used during running container
#USER postfix

# VOLUME instruction creates unnamed volume and mounts it to the provided path,
# you can override this behavior by mounting
# a selected host directory into container: "-v <host_directory>:<container_directory>"
#VOLUME ['/var/spool/postfix']

# Command which will start service during command `docker run`
#CMD ["/files/<your_script>.sh"]

