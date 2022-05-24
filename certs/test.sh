openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -subj "/CN=Kubernetes" -days 10000 -out ca.crt

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key apiserver.key -subj "/CN=Kubernetes" -days 10000 -out apiserver.crt

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key apiserver-kubelet-client.key -subj "/CN=Kubernetes" -days 10000 -out apiserver-kubelet-client.crt

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key front-proxy-client.key -subj "/CN=Kubernetes" -days 10000 -out front-proxy-client.crt



openssl x509 -enddate -noout -in ca.crt
openssl x509 -enddate -noout -in apiserver.crt
openssl x509 -enddate -noout -in apiserver-kubelet-client.crt
openssl x509 -enddate -noout -in front-proxy-client.crt
# openssl x509 -enddate -noout -in front-proxy-ca.crt

openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 3650 -in ca.csr -signkey ca.key -out ca.crt


Unable to connect to the server: x509: certificate is valid for kmaster1, kubernetes, kubernetes.default, kubernetes.default.svc, kubernetes.default.svc.cluster.local, not k8s.loabalancer.lan