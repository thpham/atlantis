## atlantis

![docker build image](https://github.com/thpham/atlantis/workflows/docker%20build%20image/badge.svg)

docker image for atlantis docker with various support.

**Base Image**

> https://hub.docker.com/r/runatlantis/atlantis/

Base Dockerfile

> https://github.com/runatlantis/atlantis/blob/master/Dockerfile

## Components

* atlantis
* ansible
* awscli
* kubergrunt
* terragrunt

## atlantis docker-compose sample.

boot atlantis and ...
atlantis contains ansible and aws credential.
Also AWS credential will be pass via env_file `atlantis.env`.

host directory tree

```
├── ansible
├── atlantis.env
├── atlantis.yaml
├── terraform
└── docker-compose.yml
```
