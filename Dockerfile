FROM alpine:latest

# Install kubectl & gettext(envsubst)

RUN apk add --no-cache --update ca-certificates gettext \
 && apk add --no-cache --update -t deps curl \
 && curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/latest.txt)/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && kubectl version --client \
 && envsubst --version