# Changelog - admindaspanel / load-balancer-caddy

### 0.12.2
__Changes__

- bumped to version 0.12.2
- Added virtul host to allow access to custom server's running into inside engines on port's 3000 and 8080.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Mon 27 Nov 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.12.1...0.12.2#diff)
______________

### load-balancer-caddy-0.2.0
__Changes__


Released by N/A, Mon 27 Nov 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/...#diff)
______________

### 0.12.1
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.12.1
- Added support to S3 virtual-host-style requests.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Mon 27 Nov 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.12.0...0.12.1#diff)
______________

### 0.12.0
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.12.0
- See changes in CHANGELOG.md
- bumped to version 0.11.0
- See changes in CHANGELOG.md
- bumped to version 0.10.0
- Added _ds subdomain for every site; this allow to implement terminal access and another services from Daspanel associated with the domain.
- Build Caddy from source insteaded from binary downladod.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Sun 15 Oct 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.9.3...0.12.0#diff)
______________

### 0.9.3
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.9.3
- Removed default entry for the hostname used. This way you can create redirects to www.hostname for any of the managed sites.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 11 Aug 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.9.2...0.9.3#diff)
______________

### 0.9.2
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.9.2
- Use data from API call when generating caddy config for site.
- Get info from API server before generate from template.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Mon 07 Aug 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.9.1...0.9.2#diff)
______________

### 0.9.1
__Changes__

- See changes in CHANGELOG.md
- bumped to version 0.9.1
- Added url for file manager service.

__Contributors__

- Abner G Jacobsen

Released by Abner G Jacobsen, Fri 04 Aug 2017 -
[see the diff](https://github.com/admindaspanel/load-balancer-caddy/compare/0.9.0...0.9.1#diff)
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


