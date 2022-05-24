echo "env_liststrhostmaster: " $env_liststrhostmaster
source ../.env
cfssl gencert \
-ca=ca.pem \
-ca-key=./ca-key.pem \
-config=./ca-config.json \
-hostname=$env_liststrhostmaster \
-profile=kubernetes ./kubernetes-csr.json | \
cfssljson -bare kubernetes

# env_liststrhostmaster=192.168.10.200,192.168.10.201,192.168.10.202,192.168.10.203,192.168.10.204,192.168.10.205,192.168.10.210,127.0.0.1,kubernetes,kubernetes.default,kmaster1,kmaster2,kmaster3,loadbalancer,kmaster1.lan,kmaster2.lan,kmaster3.lan,loadbalancer.lan,k8s.loabalancer.lan,registry.ipos.lan,repo.fabi.lan,k8sloadbalancer,k8sloadbalancer.lan,*.loabalancer.lan
