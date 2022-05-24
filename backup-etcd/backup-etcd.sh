#!/bin/bash
echo "<=========================== Program by Nguyễn Anh Tuấn ========================>"
# https://etcd.io/docs/v3.4/demo/
export lanip=`ip -4 addr show ens160| grep -oP "(?<=inet ).*(?=/)"`
echo "Lan IP: "$lanip

DATE_STR=$(date '+%d-%b-%Y')
DATE_TIME_STR=$(date +"%d-%b-%YT%T")

echo "<=================== Start bacup Etcd Date: $DATE_TIME_STR ======================>"
mkdir -p /opt/backup_etcd/

export ETCDCTL_API=3
export ENDPOINTS=https://192.168.10.200:2379,https://192.168.10.201:2379,https://102.168.10.202:2379
etcdctl --write-out=table --endpoints=$ENDPOINTS --cert=/etc/etcd/kubernetes.pem --key=/etc/etcd/kubernetes-key.pem --cacert=/etc/etcd/ca.pem  member list
etcdctl --write-out=table --endpoints=$ENDPOINTS --cert=/etc/etcd/kubernetes.pem --key=/etc/etcd/kubernetes-key.pem --cacert=/etc/etcd/ca.pem  endpoint status
etcdctl --write-out=table --endpoints=$ENDPOINTS --cert=/etc/etcd/kubernetes.pem --key=/etc/etcd/kubernetes-key.pem --cacert=/etc/etcd/ca.pem  endpoint health
etcdctl --endpoints=https://$lanip:2379  --cert=/etc/etcd/kubernetes.pem --key=/etc/etcd/kubernetes-key.pem --cacert=/etc/etcd/ca.pem   snapshot save /opt/backup_etcd/$DATE_STR-etcd.db
etcdctl --write-out=table snapshot status /opt/backup_etcd/$DATE_STR-etcd.db

# Restore
# ETCDCTL_API=3 etcdctl --endpoints 10.2.0.9:2379 snapshot restore snapshotdb
echo "<=========================== Done Backup Etcd ==================================>"
