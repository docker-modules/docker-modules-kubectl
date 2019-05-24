FROM docker:stable

# Install kubectl & helm & gettext(envsubst)

ARG HELM_VERSION="v2.11.0"

RUN apk add --update ca-certificates gettext bash \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/$(wget https://storage.googleapis.com/kubernetes-release/release/latest.txt -q -O -)/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && rm /var/cache/apk/* \
 && kubectl version --client \
 && helm version -c \
 && envsubst --version