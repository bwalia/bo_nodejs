#!/bin/bash

#echo $1
#echo $2

#Make sure minio is always running

#/usr/local/bin/kubectl delete -f kube/minio.yaml
/usr/local/bin/kubectl apply -f kube/minio.yaml

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" create-service-nginx-template.yml | /usr/local/bin/kubectl delete -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml | /usr/local/bin/kubectl delete -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml | /usr/local/bin/kubectl delete -f -

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/minio.yaml > kube/minio-$1.yaml

sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml > kube/lfc-bo-$1.yaml
sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml > kube/mongo-$1.yaml

/usr/local/bin/kubectl apply -f kube/lfc-bo-$1.yaml
/usr/local/bin/kubectl apply -f kube/mongo-$1.yaml

#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-bo.yaml | /usr/local/bin/kubectl apply -f -
#sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/mongo.yaml | /usr/local/bin/kubectl apply -f -

sed "s^#SERVICE_CODE#^$1^g;s^#SERVICE_PORT#^$2^g" kube/lfc-rpxy-nginx.yml > kube/lfc-rpxy-nginx-$1.yaml

/usr/local/bin/kubectl apply -f kube/lfc-rpxy-nginx-$1.yaml

##/usr/local/bin/kubectl get deployments --all-namespaces

##/usr/local/bin/kubectl get svc --all-namespaces

