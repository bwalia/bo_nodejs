#!/bin/bash

#echo $1
#echo $2

#Make sure minio is always running

# /kube/kubectl delete -f kube/minio.yaml
/kube/kubectl apply -f kube/minio.yaml

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" create-service-nginx-template.yml |  /kube/kubectl delete -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml |  /kube/kubectl delete -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml |  /kube/kubectl delete -f -

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/minio.yaml > kube/minio-$1.yaml

sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml > kube/lfc-bo-$1.yaml
sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml > kube/mongo-$1.yaml

#/kube/kubectl delete -f kube/lfc-bo-$1.yaml
/kube/kubectl scale --replicas=0 deployment/lfc-bo-$1

#kube/kubectl scale --replicas=0 deployment/lfc-bo-$1 && kube/kubectl scale --replicas=2 deployment/lfc-bo-$1

/kube/kubectl apply -f kube/lfc-bo-$1.yaml
/kube/kubectl apply -f kube/mongo-$1.yaml

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml |  /kube/kubectl apply -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml |  /kube/kubectl apply -f -

sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-rpxy-nginx.yml > kube/lfc-rpxy-nginx-$1.yaml

/kube/kubectl apply -f kube/lfc-rpxy-nginx-$1.yaml

/kube/kubectl rollout history deployment/lfc-bo-$1

## /kube/kubectl get deployments --all-namespaces
## /kube/kubectl get svc --all-namespaces

#rollback

#kubectl rollout undo deployment/app --to-revision=2


