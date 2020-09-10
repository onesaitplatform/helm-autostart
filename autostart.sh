#!/bin/bash

# if an error occurs the script stops inmediately
set -e

help() {
  echo
  echo "Plugin usage:"
  echo
  echo "helm auto-start --namespace onesait-platform"
  echo
}

parseParams() {

  if [[ ${#params[@]} -lt 2 ]]; then
    echo "Bad number of params!"
    help
    exit 1
  fi

  if [[ ${params[0]} != '--namespace' ]]; then
    echo "Bad parameter! --namespace"
    help
    exit 1
  fi

  namespace=${params[1]}

}

# Load configuration file
#source $HELM_PLUGIN_DIR/config.properties

echo "K8s Namespace: $HELM_NAMESPACE"

params=("$@")

parseParams

echo $namespace
	                   
echo "[$(date)] Starting quasar deployment" >> /var/log/onesait.log
echo "Desplegando cosas"
#kubectl scale deployment quasar --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 10s

#echo "[$(date)] Starting Cache service" >> /var/log/onesait.log
#kubectl scale deployment cacheservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log
	  
#sleep 30s  
	    
#echo "[$(date)] Starting Control Panel deployment" >> /var/log/onesait.log
#kubectl scale deployment controlpanelservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log
	  
#sleep 400s 
	   
#echo "[$(date)] Starting Semantic Information Broker deployment" >> /var/log/onesait.log
#kubectl scale deployment routerservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	        
#echo "[$(date)] Starting IoT broker deployment" >> /var/log/onesait.log
#kubectl scale deployment iotbrokerservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log
	    
#sleep 60s
	          
#echo "[$(date)] Starting OAuth deployment" >> /var/log/onesait.log
#kubectl scale deployment oauthservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s    
	    
#echo "[$(date)] Starting API manager deployment" >> /var/log/onesait.log
#kubectl scale deployment apimanagerservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	    
#echo "[$(date)] Starting DashBoard Engine deployment" >> /var/log/onesait.log
#kubectl scale deployment dashboardengineservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	        
#echo "[$(date)] Starting RTDB Maintainer deployment" >> /var/log/onesait.log
#kubectl scale deployment rtdbmaintainerservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	        
#echo "[$(date)] Starting Device Simulator deployment" >> /var/log/onesait.log
#kubectl scale deployment devicesimulator --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	        
#echo "[$(date)] Starting Monitoring UI deployment" >> /var/log/onesait.log
#kubectl scale deployment monitoringuiservice --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
    
#echo "[$(date)] Starting Notebooks deployment" >> /var/log/onesait.log
#kubectl scale deployment zeppelin --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log
 
#sleep 60s    

#echo "[$(date)] Starting Streamsets deployment" >> /var/log/onesait.log
#kubectl scale deployment streamsets --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s

#echo "[$(date)] Starting Streamsets-secondary deployment" >> /var/log/onesait.log
#kubectl scale deployment streamsets-secondary --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log

#sleep 60s
	    
#echo "[$(date)] Starting Load Balancer deployment" >> /var/log/onesait.log
#kubectl scale deployment loadbalancer --namespace=$domain --replicas=1 2>&1 >> /var/log/onesait.log


