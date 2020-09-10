#!/bin/bash

# if an error occurs the script stops inmediately
set -e

help() {
  echo
  echo "Plugin usage:"
  echo
  echo "helm autostart --k8s_namespace <namespace_name> --peristence <true/false> --op_modules <true/false> --configinit <true/false>"
  echo
}

parseParams() {

  if [[ ${#params[@]} -lt 8 ]]; then
    echo "Bad number of params!"
    help
    exit 1
  fi

  if [[ ${params[0]} != '--k8s_namespace' ]]; then
    echo "Bad parameter! --k8s_namespace"
    help
    exit 1
  fi

  if [[ ${params[2]} != '--peristence' ]]; then
    echo "Bad parameter! --peristence"
    help
    exit 1
  fi

  if [[ ${params[4]} != '--op_modules' ]]; then
    echo "Bad parameter! --op_modules"
    help
    exit 1
  fi

  if [[ ${params[6]} != '--configinit' ]]; then
    echo "Bad parameter! --configinit"
    help
    exit 1
  fi

  k8s_namespace=${params[1]}

}


params=("$@")

parseParams

echo "[$(date)] K8s Namespace: "$k8s_namespace

echo "[$(date)] Persistence deployment:"
echo ${params[3]}
echo "[$(date)] Configinit deployment:"
echo ${params[5]}
echo "[$(date)] OP modules deployment:"
echo ${params[7]}

if [[ ${params[3]} == true ]]; then
  sleep 5s
  echo "[$(date)] Starting configdb deployment" 
  kubectl scale deployment configdb --namespace=$k8s_namespace --replicas=1  
  sleep 10s
  echo "[$(date)] Starting realtimdb deployment" 
  kubectl scale deployment realtimedb --namespace=$k8s_namespace --replicas=1
  sleep 10s  
  echo "[$(date)] Starting quasar deployment" 
  kubectl scale deployment quasar --namespace=$k8s_namespace --replicas=1
  sleep 10s 
  echo "[$(date)] Starting elasticdb deployment" 
  kubectl scale deployment elasticdb --namespace=$k8s_namespace --replicas=1
  sleep 10s 
  echo "[$(date)] Starting schedulerdb deployment" 
  kubectl scale deployment schedulerdb --namespace=$k8s_namespace --replicas=1 
fi

if [[ ${params[5]} == true ]]; then
  echo "[$(date)] Starting configinit deployment"
  sleep 10s 
  kubectl scale deployment configinit --namespace=$k8s_namespace --replicas=1
  sleep 300s  
  kubectl scale deployment configinit --namespace=$k8s_namespace --replicas=0
fi
   
if [[ ${params[7]} == true ]]; then                  
  echo "[$(date)] Starting zookeeper deployment" 
  kubectl scale deployment zookeeper --namespace=$k8s_namespace --replicas=1  
  
  sleep 10s
  
  echo "[$(date)] Starting Cache service" 
  kubectl scale deployment cacheservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 30s  
    
  echo "[$(date)] Starting Control Panel deployment" 
  kubectl scale deployment controlpanelservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 400s 
    
  echo "[$(date)] Starting Semantic Information Broker deployment" 
  kubectl scale deployment routerservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
      
  echo "[$(date)] Starting IoT broker deployment" 
  kubectl scale deployment iotbrokerservice --namespace=$k8s_namespace --replicas=1  
    
  sleep 60s
      
  echo "[$(date)] Starting OAuth deployment" 
  kubectl scale deployment oauthservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s    
    
  echo "[$(date)] Starting API manager deployment" 
  kubectl scale deployment apimanagerservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
    
  echo "[$(date)] Starting DashBoard Engine deployment" 
  kubectl scale deployment dashboardengineservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
      
  echo "[$(date)] Starting RTDB Maintainer deployment" 
  kubectl scale deployment rtdbmaintainerservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
      
  echo "[$(date)] Starting Device Simulator deployment" 
  kubectl scale deployment devicesimulator --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
      
  echo "[$(date)] Starting Monitoring UI deployment" 
  kubectl scale deployment monitoringuiservice --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
  
  echo "[$(date)] Starting Notebooks deployment" 
  kubectl scale deployment zeppelin --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s    
  
  echo "[$(date)] Starting Streamsets deployment" 
  kubectl scale deployment streamsets --namespace=$k8s_namespace --replicas=1  
  
  sleep 60s
    
  echo "[$(date)] Starting Load Balancer deployment" 
  kubectl scale deployment loadbalancer --namespace=$k8s_namespace --replicas=1  
fi

