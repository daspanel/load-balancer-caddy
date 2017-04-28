
# Usage


### Get
```shell
$ docker pull daspanel/load-balancer-caddy:latest
```

### Run
```shell
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-load-balancer-caddy daspanel/load-balancer-caddy:latest
```

### Stop
```shell
$ docker stop my-load-balancer-caddy
```

### Update image
```shell
$ docker stop my-load-balancer-caddy
$ docker pull daspanel/load-balancer-caddy:latest
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-load-balancer-caddy daspanel/load-balancer-caddy:latest
```

# Tips
