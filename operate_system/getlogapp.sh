#!/usr/bin/env bash

NAMESPACE=$1
DEPLOYMENT=$2
SINCE=$3
echo  "name space: "$NAMESPACE
echo  "deployment: "$DEPLOYMENT
for p in $(kubectl get pods -n $NAMESPACE| grep ^${DEPLOYMENT}- | cut -f 1 -d ' '); do 
    echo --------------------------- 
    echo "REPLICA SET: "$p 
    echo --------------------------- 
    kubectl logs $p -n $NAMESPACE --since=$SINCE
done
