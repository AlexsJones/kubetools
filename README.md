# kubetools

Useful tools I end up using day in and out.

_Install kubernetes on docker_

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.kube:/root/.kube -v ${PWD}:/config tibbar/kubetools:0.0.1 kind create cluster;kind export kubeconfig
```

_Install a helm chart_
```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.kube:/root/.kube -v ${PWD}:/config tibbar/kubetools:0.0.1 helm install stable/nginx --generate-name
```

_Install linkerd_

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${HOME}/.kube:/root/.kube -v ${PWD}:/config tibbar/kubetools:0.0.1 linkerd install | kubectl apply -f -
```


## Versions

| Tool    | Version |
|---------|---------|
| Kubectl | 1.17.0  |
| Helm    | 3.0.2   |
| Kind    | 0.7.0   |
| Linkerd | Latest  |
