
![Docker Image CI](https://github.com/ismailyenigul/dockernettools/workflows/Docker%20Image%20CI/badge.svg?branch=master)

# dockernettools

Openshift compatible Docker image with connectivity tools(psql, mysql,  curl, ssh, telnet, nc, dig, swaks and more)

=======
Based on alpine:edge

CMD and USER set the following to run on Openshift or Kubernetes without providing command

```
USER 1001
CMD ["sh", "-c", "tail -f /dev/null"]
```



## General Usage


When using containers you might want to test the connectivity between the containers. Your application containers won't be having tools like curl, ping, psql client etc. So you can start a one-off container using this image and test your application.

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
 * curl, wget, http, nc, busybox-extras telnet, swaks
 * vim, nano
 * host, nslookup,dig 
 * jq
 * ssh, sftp
 * ip, ping

