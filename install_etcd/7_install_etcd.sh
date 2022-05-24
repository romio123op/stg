#mkdir /etc/etcd /var/lib/etcd
#mv ../certs/ca.pem ../certs/kubernetes.pem ../certs/kubernetes-key.pem /etc/etcd
#cp ../.env /etc/etcd/.env
#wget https://github.com/coreos/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz
#tar xvzf etcd-v3.3.9-linux-amd64.tar.gz
#mv etcd-v3.3.9-linux-amd64/etcd* /usr/local/bin/


wget https://github.com/etcd-io/etcd/releases/download/v3.4.16/etcd-v3.4.16-linux-amd64.tar.gz
tar xvzf etcd-v3.4.16-linux-amd64.tar.gz
mv etcd-v3.4.16-linux-amd64/etcd* /usr/local/bin/

