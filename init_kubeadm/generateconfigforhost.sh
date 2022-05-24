#!/bin/bash

export env_host_kmaster1=kmaster1.lan
export env_host_kmaster2=kmaster2.lan
export env_host_kmaster3=kmaster3.lan
# Create temp directories to store files that will end up on other hosts.
rm -rf ./${env_host_kmaster1}/ ./${env_host_kmaster2}/ ./${env_host_kmaster3}/
mkdir -p ./${env_host_kmaster1}/ ./${env_host_kmaster2}/ ./${env_host_kmaster3}/

ETCDHOSTS=(${env_host_kmaster1} ${env_host_kmaster2} ${env_host_kmaster3})
NAMES=("infra0" "infra1" "infra2")

for i in "${!ETCDHOSTS[@]}"; do
HOST=${ETCDHOSTS[$i]}
NAME=${NAMES[$i]}
cat << EOF > ./${HOST}/kubeadmcfg.yaml
apiVersion: "kubeadm.k8s.io/v1beta2"
kind: ClusterConfiguration
kubernetesVersion: stable
apiServer:
  certSANs:
  - "k8s.loabalancer.lan"
controlPlaneEndpoint: "k8s.loabalancer.lan:6443"
etcd:
    external:
        endpoints:
        - https://kmaster1.lan:2379
        - https://kmaster2.lan:2379
        - https://kmaster3.lan:2379
        caFile: /etc/etcd/ca.pem
        certFile: /etc/etcd/kubernetes.pem
        keyFile: /etc/etcd/kubernetes-key.pem
networking:
  podSubnet: 10.40.0.0/16
EOF
done
#10.244.0.0/16 Flannel

