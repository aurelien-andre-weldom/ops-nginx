# OPS NGINX

Create your nginx templates in an automated way 

@depends : https://github.com/aurelien-andre-weldom/ops-php

### Terraform Versions

```json
{
  "100.0.0": {
    "variants": [
      "8.1-buster-fpm"
    ],
    "version": "100.0.0"
  }
}
```

### Usage

Edit dockerfile.template

```shell
# Update all versions
bash run-update.sh
```

```shell
# Build all docker images
bash run-build.sh
```

### Env Configuration

```dotenv
NGINX_WORKER_PROCESSES=5
NGINX_WORKER_CONNECTIONS=500
```

### Test

```shell
docker run -it --rm \
--name ops-nginx \
-p 9001:9001 \
-p 80:80 \
-p 443:443 \
ops-nginx/nginx:100.0.0-8.1-buster-fpm
```

@see http://localhost:9001 && http://localhost