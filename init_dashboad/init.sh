#kubectl delete -f ./k8sdashboard_v1.20.yaml
#kubectl delete -f ./k8s-dashboard-ingress.yaml
#kubectl create namespace kubernetes-dashboard
#kubectl create secret generic kubernetes-dashboard-certs --from-file=/opt/certs -n kubernetes-dashboard
##kubectl create secret generic kubernetes-dashboard-certs --cert /opt/certs/ipos.vn.crt  --key /opt/certs/ipos.vn.key -n kubernetes-dashboard

#kubectl apply -f ./k8sdashboard_v1.20.yaml
#kubectl apply -f ./k8s-dashboard-ingress.yaml

kubectl delete -f ./k8s_dashboard_v2.2.0.yaml
kubectl delete -f ./k8s-dashboard-ingress.yaml
kubectl create namespace kubernetes-dashboard
kubectl create secret generic kubernetes-dashboard-certs --from-file=./ipos-certs -n kubernetes-dashboard
#kubectl create secret generic kubernetes-dashboard-certs --cert /opt/certs/ipos.vn.crt  --key /opt/certs/ipos.vn.key -n kubernetes-dashboard

kubectl apply -f ./k8s_dashboard_v2.2.0.yaml
kubectl apply -f ./k8s-dashboard-ingress.yaml
