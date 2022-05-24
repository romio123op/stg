1. prometheus
```
# helm inspect values stable/prometheus > prometheus.yaml

```
- edit resource file

```
# helm install prometheus --namespace monitoring -f prometheus.yaml stable/prometheus
# helm upgrade prometheus --namespace monitoring -f prometheus.yaml stable/prometheus
# heml -n monitoring ls
```

1. grafana
```
# helm inspect values stable/grafana > grafana.yaml

```
- edit resource file

```
# helm install grafana --namespace monitoring -f grafana.yaml stable/grafana
# helm upgrade grafana --namespace monitoring -f grafana.yaml stable/grafana
# heml -n monitoring ls
```
- get password for admin
```
# kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```