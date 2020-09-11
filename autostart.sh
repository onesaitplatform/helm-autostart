#!/bin/bash

# if an error occurs the script stops inmediately
set -e

help() {
  echo
  echo "Plugin usage:"
  echo
  echo "helm autostart --k8s_namespace <namespace_name> --peristence <true/false> --configinit <true/false> --zookeeper <true/false> --cacheservice <true/false> --controlpanel <true/false> --router <true/false> --iotbroker <true/false> --oauth <true/false> --apimanager <true/false> --dashboard <true/false> --rtdbmaintainer <true/false> --devicesimulator <true/false> --monitoringui <true/false> --notebooks <true/false> --dataflow <true/false> --loadbalancer <true/false>"
  echo
}

parseParams() {

  if [[ ${#params[@]} -lt 34 ]]; then
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

  if [[ ${params[4]} != '--configinit' ]]; then
    echo "Bad parameter! --configinit"
    help
    exit 1
  fi

  if [[ ${params[6]} != '--zookeeper' ]]; then
    echo "Bad parameter! --zookeeper"
    help
    exit 1
  fi

  if [[ ${params[8]} != '--cacheservice' ]]; then
    echo "Bad parameter! --cacheservice"
    help
    exit 1
  fi

  if [[ ${params[10]} != '--controlpanel' ]]; then
    echo "Bad parameter! --controlpanel"
    help
    exit 1
  fi

  if [[ ${params[12]} != '--router' ]]; then
    echo "Bad parameter! --router"
    help
    exit 1
  fi

  if [[ ${params[14]} != '--iotbroker' ]]; then
    echo "Bad parameter! --iotbroker"
    help
    exit 1
  fi

  if [[ ${params[16]} != '--oauth' ]]; then
    echo "Bad parameter! --oauth"
    help
    exit 1
  fi

  if [[ ${params[18]} != '--apimanager' ]]; then
    echo "Bad parameter! --apimanager"
    help
    exit 1
  fi

  if [[ ${params[20]} != '--dashboard' ]]; then
    echo "Bad parameter! --dashboard"
    help
    exit 1
  fi

  if [[ ${params[22]} != '--rtdbmaintainer' ]]; then
    echo "Bad parameter! --rtdbmaintainer"
    help
    exit 1
  fi

  if [[ ${params[24]} != '--devicesimulator' ]]; then
    echo "Bad parameter! --devicesimulator"
    help
    exit 1
  fi

  if [[ ${params[26]} != '--monitoringui' ]]; then
    echo "Bad parameter! --monitoringui"
    help
    exit 1
  fi

  if [[ ${params[28]} != '--notebooks' ]]; then
    echo "Bad parameter! --notebooks"
    help
    exit 1
  fi

  if [[ ${params[30]} != '--dataflow' ]]; then
    echo "Bad parameter! --dataflow"
    help
    exit 1
  fi

  if [[ ${params[32]} != '--loadbalancer' ]]; then
    echo "Bad parameter! --loadbalancer"
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
echo "[$(date)] Zookeeper deployment:"
echo ${params[7]}
echo "[$(date)] Cacheservice deployment:"
echo ${params[9]}
echo "[$(date)] Controlpanel deployment:"
echo ${params[11]}
echo "[$(date)] Router deployment:"
echo ${params[13]}
echo "[$(date)] Iot-broker deployment:"
echo ${params[15]}
echo "[$(date)] Oauth deployment:"
echo ${params[17]}
echo "[$(date)] Api-manager deployment:"
echo ${params[19]}
echo "[$(date)] Dashboardengine deployment:"
echo ${params[21]}
echo "[$(date)] Rtdbmaintainer deployment:"
echo ${params[23]}
echo "[$(date)] Devicesimulator deployment:"
echo ${params[25]}
echo "[$(date)] Monitoringui deployment:"
echo ${params[27]}
echo "[$(date)] Notebooks deployment:"
echo ${params[29]}
echo "[$(date)] Streamsets deployment:"
echo ${params[31]}
echo "[$(date)] Loadbalancer deployment:"
echo ${params[33]}



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
  sleep 10s                 
  echo "[$(date)] Starting zookeeper deployment" 
  kubectl scale deployment zookeeper --namespace=$k8s_namespace --replicas=1 
fi

if [[ ${params[9]} == true ]]; then  
  sleep 20s  
  echo "[$(date)] Starting Cache service" 
  kubectl scale deployment cacheservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[11]} == true ]]; then  
  sleep 30s      
  echo "[$(date)] Starting Control Panel deployment" 
  kubectl scale deployment controlpanelservice --namespace=$k8s_namespace --replicas=1
  sleep 400s 
fi
   
if [[ ${params[13]} == true ]]; then    
  echo "[$(date)] Starting Semantic Information Broker deployment" 
  kubectl scale deployment routerservice --namespace=$k8s_namespace --replicas=1  
  sleep 60s
fi
   
if [[ ${params[15]} == true ]]; then       
  echo "[$(date)] Starting IoT broker deployment" 
  kubectl scale deployment iotbrokerservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[17]} == true ]]; then    
  sleep 60s      
  echo "[$(date)] Starting OAuth deployment" 
  kubectl scale deployment oauthservice --namespace=$k8s_namespace --replicas=1  
fi
   
if [[ ${params[19]} == true ]]; then
  sleep 60s    
  echo "[$(date)] Starting API manager deployment" 
  kubectl scale deployment apimanagerservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[21]} == true ]]; then  
  sleep 60s    
  echo "[$(date)] Starting DashBoard Engine deployment" 
  kubectl scale deployment dashboardengineservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[23]} == true ]]; then  
  sleep 60s      
  echo "[$(date)] Starting RTDB Maintainer deployment" 
  kubectl scale deployment rtdbmaintainerservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[25]} == true ]]; then  
  sleep 60s      
  echo "[$(date)] Starting Device Simulator deployment" 
  kubectl scale deployment devicesimulator --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[27]} == true ]]; then  
  sleep 60s      
  echo "[$(date)] Starting Monitoring UI deployment" 
  kubectl scale deployment monitoringuiservice --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[29]} == true ]]; then  
  sleep 60s  
  echo "[$(date)] Starting Notebooks deployment" 
  kubectl scale deployment zeppelin --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[31]} == true ]]; then  
  sleep 60s  
  echo "[$(date)] Starting Streamsets deployment" 
  kubectl scale deployment streamsets --namespace=$k8s_namespace --replicas=1
fi
   
if [[ ${params[33]} == true ]]; then  
  sleep 60s    
  echo "[$(date)] Starting Load Balancer deployment" 
  kubectl scale deployment loadbalancer --namespace=$k8s_namespace --replicas=1  
fi