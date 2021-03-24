helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add elastic https://helm.elastic.co
helm repo remove minio
helm repo add minio https://operator.min.io/
helm repo update
helm install --namespace report --create-namespace --generate-name minio/report
kubectl apply -f https://github.com/minio/operator/blob/master/examples/tenant.yaml
helm install elasticsearch elastic/elasticsearch -n report
helm install postgresql bitnami/postgresql -n report
helm install rabbitmq bitnami/rabbitmq -n report
helm install reportportal reportportal/ -n report --values reportportal/values.yaml
