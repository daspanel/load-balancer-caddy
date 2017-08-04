# Changelog - admindaspanel / load-balancer-caddy

### 0.9.1
__Changes__

- bumped to version 0.9.1
- Added url for file manager service.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 04 Aug 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.9.0...0.9.1#diff)
______________

### load-balancer-caddy-0.2.0
__Changes__


Released by N/A, Fri 04 Aug 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/...#diff)
______________

### 0.9.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.9.0
- When the configured hostname is not daspanel.site load balancer will attempt to use valid certificates for DASPANEL services. Valid certificates for hosted sites will be obtained by using admin's email.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Mon 24 Jul 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.8.0...0.9.0#diff)
______________

### 0.8.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.8.0
- Need to install openssl binary to work.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Sat 08 Jul 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.7.0...0.8.0#diff)
______________

### 0.7.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.7.0
- Removed dependence from daspanel/alpine-base.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Wed 05 Jul 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.6.0...0.7.0#diff)
______________

### 0.6.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.6.0
- Enabled use of real certificates by Letsencrypt.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 23 Jun 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.5.0...0.6.0#diff)
______________

### 0.5.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.5.0

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Wed 21 Jun 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.4.0...0.5.0#diff)
______________

### 0.4.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.4.0
- For now, only one template is required to serve all HTTP engines.
- Implemented the use of self signed SSL certificates as well as valid certificates signed by LetsEncrypt. Valid certificates are only used if the value of DASPANEL_SYS_HOSTNAME is not equal to 'daspanel.site'
- Changed way as Caddy reloads vhosts from caddyfile as instructed in https://caddyserver.com/blog/certificate-management-policies

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Wed 07 Jun 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.5...0.4.0#diff)
______________

### 0.3.5
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.5
- Generate certs for sites with domains not equal the DASPANEL hostname.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 26 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.4...0.3.5#diff)
______________

### 0.3.4
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.4
- Modified Adminer container internal to be proxied with https only.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Tue 23 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.3...0.3.4#diff)
______________

### 0.3.3
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.3
- Corrected the way load balancer proxy https requests to internal containers.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Sat 13 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.2...0.3.3#diff)
______________

### 0.3.2
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.2
- Cleanup.
- redis-exec does not allow to pass parameters to the script to be executed.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 12 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.1...0.3.2#diff)
______________

### 0.3.1
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.1
- Bugfix

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 12 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.3.0...0.3.1#diff)
______________

### 0.3.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.3.0
- Changed release and tags naming.
- Initialization of the container using settings obtained from the API server.
- Removed Caddy plugin minify due bugs reported in Caddy forum. Added bash and openssl to allow generation os selg signed certificates.
- See changes in CHANGELOG.md
- bumped to version 0.2.0
- First implemantation
- Caddy installation.
- first commit

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 12 May 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/2ef03242c92bf3b3d43e2388304650ed938977d3...0.3.0#diff)
______________


