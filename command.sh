kubectl apply -f tiller-account-rbac.yaml
helm init --service-account=tiller --stable-repo-url=https://kubernetes-charts.storage.googleapis.com --upgrade --automount-service-account-token=true --replicas=1 --history-max=100 --wait

helm install pag webid-map/ -n pag --values webid-map/values.yaml
