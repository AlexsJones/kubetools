FROM alpine:3.10
ENV KUBE_LATEST_VERSION="v1.17.0"
ENV HELM_VERSION="v3.0.2"
ENV HELMFILE_VERSION="v0.98.2"
ENV KIND_VERSION="v0.7.0"
ENV PATH="${PATH}:/root/.linkerd2/bin"
RUN apk add --no-cache ca-certificates bash git openssh curl python python-dev py-pip build-base docker\
    && pip install dumb-init && apk del \
		python \
		python-dev \
		py-pip \
		build-base \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && wget -q https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-$(uname)-amd64 -O /usr/local/bin/kind \
    && chmod +x /usr/local/bin/kind \
    && wget -q https://github.com/roboll/helmfile/releases/download/${HELMFILE_VERSION}/helmfile_linux_amd64 -O /usr/local/bin/helmfile \
    && chmod +x /usr/local/bin/helmfile
RUN mkdir -p ${HOME}/.linkerd2 ${HOME}/.linkerd2/bin; wget -q https://github.com/linkerd/linkerd2/releases/download/edge-20.1.4/linkerd2-cli-edge-20.1.4-linux -O ${HOME}/.linkerd2/bin/linkerd \
    && chmod +x ${HOME}/.linkerd2/bin/linkerd
WORKDIR /config
ENTRYPOINT ["dumb-init"]
CMD ["/bin/sh"]
