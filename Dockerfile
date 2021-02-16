FROM runatlantis/atlantis:v0.15.1

# python3 and ansible
RUN set -ex && \
    apk add --no-cache build-base python3-dev py3-pip libffi-dev openssl-dev rust cargo && \
    pip install --upgrade pip && \
    pip install ansible && \
    apk del build-base libffi-dev openssl-dev rust cargo

RUN set -ex && \
    apk add --no-cache jq

RUN set -ex && \
    apk update && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make linux-headers && \
    pip --no-cache-dir install awscli && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apk del build gcc make

RUN set -ex && \
    curl -L -o /usr/local/bin/kubergrunt https://github.com/gruntwork-io/kubergrunt/releases/download/v0.6.8/kubergrunt_linux_amd64 && \
    chmod +x /usr/local/bin/kubergrunt

RUN set -ex && \
    curl -L -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.26.7/terragrunt_linux_amd64 && \
    chmod +x /usr/local/bin/terragrunt

WORKDIR /home/atlantis

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server", "--allow-repo-config"]
