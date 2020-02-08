VERSION=`cat VERSION`
all:
	docker build -t kubetools:$(VERSION) .
publish:
	docker tag kubetools:$(VERSION) tibbar/kubetools:$(VERSION)
	docker push tibbar/kubetools:$(VERSION)
