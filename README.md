# php-fpm
php-fpm docker with wp-cli and modules to make Wordpress work

## Location
```
docker pull maikel/php-fpm

```

### Docker image contains:
- php:fpm-alpine3.9 base image
- WP-CLI latest version
- curl 
- ssmtp

### PHP modules extra installed
- mbstring
- exif
- zip
- pdo
- pdo_mysq
- mysqli
- bcmath
- imagick 

### PHP settings and documentation found at
https://hub.docker.com/_/php

#### Enable SMTP
Location of ssmtp is at /etc/ssmtp/ssmtp.conf
copy and mount file. 

Example file can be found at example_files/
