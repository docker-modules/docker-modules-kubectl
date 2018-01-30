FROM alpine:latest

# Install kubectl & gettext(envsubst)

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && apk add --update gettext \
 && curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/latest.txt)/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && curl -L -o /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
 && curl -L -o glibc-2.26-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-2.26-r0.apk \
 && apk add glibc-2.26-r0.apk \
 && rm -f glibc-2.26-r0.apk /etc/apk/keys/sgerrand.rsa.pub \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && kubectl version --client \
 && envsubst --version