
![Docker Image CI](https://github.com/ismailyenigul/dockernettools/workflows/Docker%20Image%20CI/badge.svg?branch=master)

# dockernettools

Openshift and Kubernetes compatible Docker image with connectivity tools(psql, mysql,  curl, ssh, telnet, nc, dig, swaks and more)

=======

Based on alpine:edge

CMD and USER set the following to run on Openshift or Kubernetes without providing a command

```
USER 1001
CMD ["sh", "-c", "tail -f /dev/null"]
```



## General Usage


When using containers you might want to test the connectivity between the containers. Most of the  application containers won't be having tools to keep image size minimum. So you can start a container  using this image and test your application.

To run a on Kubernetes:

```
kubectl run --rm utils -it --generator=run-pod/v1 --image ismailyenigul/dockernettools bash
```

To run on docker engine

```
$ docker run --rm -it ismailyenigul/dockernettools bash

```

## Available Commands
 * mysql, psql, redis-cli
 * curl, wget, http(httpie), nc, busybox-extras telnet, swaks
 * vim, nano
 * host, nslookup,dig 
 * jq
 * ssh, sftp
 * ip, ping

