#!/bin/bash

# if an error occurs the script stops inmediately
set -e

help() {
  echo
  echo "Plugin usage:"
  echo
  echo "helm autostart --k8s_namespace <namespace_name> --peristence <true/false> --zookeeper <true/false> --cacheservice <true/false> --controlpanel <true/false> --router <true/false> --iotbroker <true/false> --oauth <true/false> --apimanager <true/false> --dashboard <true/false> --rtdbmaintainer <true/false> --devicesimulator <true/false> --monitoringui <true/false> --notebooks <true/false> --dataflow <true/false> --flowengine <true/false> --rulesengine <true/false> --bpmengine <true/false> --loadbalancer <true/false> --gravitee <true/false> --keycloak <true/false> --graylog <true/false> <start/stop/status>"
  echo
}

parseParams() {

  if [[ ${#params[@]} -lt 45 ]]; then
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

  if [[ ${params[4]} != '--zookeeper' ]]; then
    echo "Bad parameter! --zookeeper"
    help
    exit 1
  fi

  if [[ ${params[6]} != '--cacheservice' ]]; then
    echo "Bad parameter! --cacheservice"
    help
    exit 1
  fi

  if [[ ${params[8]} != '--controlpanel' ]]; then
    echo "Bad parameter! --controlpanel"
    help
    exit 1
  fi

  if [[ ${params[10]} != '--router' ]]; then
    echo "Bad parameter! --router"
    help
    exit 1
  fi

  if [[ ${params[12]} != '--iotbroker' ]]; then
    echo "Bad parameter! --iotbroker"
    help
    exit 1
  fi

  if [[ ${params[14]} != '--oauth' ]]; then
    echo "Bad parameter! --oauth"
    help
    exit 1
  fi

  if [[ ${params[16]} != '--apimanager' ]]; then
    echo "Bad parameter! --apimanager"
    help
    exit 1
  fi

  if [[ ${params[18]} != '--dashboard' ]]; then
    echo "Bad parameter! --dashboard"
    help
    exit 1
  fi

  if [[ ${params[20]} != '--rtdbmaintainer' ]]; then
    echo "Bad parameter! --rtdbmaintainer"
    help
    exit 1
  fi

  if [[ ${params[22]} != '--devicesimulator' ]]; then
    echo "Bad parameter! --devicesimulator"
    help
    exit 1
  fi

  if [[ ${params[24]} != '--monitoringui' ]]; then
    echo "Bad parameter! --monitoringui"
    help
    exit 1
  fi

  if [[ ${params[26]} != '--notebooks' ]]; then
    echo "Bad parameter! --notebooks"
    help
    exit 1
  fi

  if [[ ${params[28]} != '--dataflow' ]]; then
    echo "Bad parameter! --dataflow"
    help
    exit 1
  fi

  if [[ ${params[30]} != '--flowengine' ]]; then
    echo "Bad parameter! --flowengine"
    help
    exit 1
  fi

  if [[ ${params[32]} != '--rulesengine' ]]; then
    echo "Bad parameter! --rulesengine"
    help
    exit 1
  fi

  if [[ ${params[34]} != '--bpmengine' ]]; then
    echo "Bad parameter! --bpmengine"
    help
    exit 1
  fi


  if [[ ${params[36]} != '--loadbalancer' ]]; then
    echo "Bad parameter! --loadbalancer"
    help
    exit 1
  fi

  if [[ ${params[38]} != '--gravitee' ]]; then
    echo "Bad parameter! --gravitee"
    help
    exit 1
  fi

  if [[ ${params[40]} != '--keycloak' ]]; then
    echo "Bad parameter! --keycloak"
    help
    exit 1
  fi

  if [[ ${params[42]} != '--graylog' ]]; then
    echo "Bad parameter! --graylog"
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
echo "[$(date)] Zookeeper deployment:"
echo ${params[5]}
echo "[$(date)] Cacheservice deployment:"
echo ${params[7]}
echo "[$(date)] Controlpanel deployment:"
echo ${params[9]}
echo "[$(date)] Router deployment:"
echo ${params[11]}
echo "[$(date)] Iot-broker deployment:"
echo ${params[13]}
echo "[$(date)] Oauth deployment:"
echo ${params[15]}
echo "[$(date)] Api-manager deployment:"
echo ${params[17]}
echo "[$(date)] Dashboardengine deployment:"
echo ${params[19]}
echo "[$(date)] Rtdbmaintainer deployment:"
echo ${params[21]}
echo "[$(date)] Devicesimulator deployment:"
echo ${params[23]}
echo "[$(date)] Monitoringui deployment:"
echo ${params[25]}
echo "[$(date)] Notebooks deployment:"
echo ${params[27]}
echo "[$(date)] Streamsets deployment:"
echo ${params[29]}
echo "[$(date)] Flowengine deployment:"
echo ${params[31]}
echo "[$(date)] Rulesengine deployment:"
echo ${params[33]}
echo "[$(date)] Bpmengine deployment:"
echo ${params[35]}
echo "[$(date)] Loadbalancer deployment:"
echo ${params[37]}
echo "[$(date)] Gravitee deployment:"
echo ${params[39]}
echo "[$(date)] Keycloak deployment:"
echo ${params[41]}
echo "[$(date)] Graylog deployment:"
echo ${params[43]}


if [[ ${params[44]} == "start" ]]; then
  if [[ ${params[3]} == true ]]; then
    sleep 5s
    echo "[$(date)] Starting configdb deployment" 
    kubectl scale deployment configdb --namespace=$k8s_namespace --replicas=1  
    sleep 10s
    echo "[$(date)] Starting realtimdb deployment" 
    kubectl scale deployment realtimedb --namespace=$k8s_namespace --replicas=1
    sleep 10s 
    echo "[$(date)] Starting elasticdb deployment" 
    kubectl scale deployment elasticdb --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[5]} == true ]]; then 
    sleep 10s                 
    echo "[$(date)] Starting zookeeper deployment" 
    kubectl scale deployment zookeeper --namespace=$k8s_namespace --replicas=1 
  fi
  
  if [[ ${params[7]} == true ]]; then  
    sleep 20s  
    echo "[$(date)] Starting Cache service" 
    kubectl scale deployment cacheservice --namespace=$k8s_namespace --replicas=1
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Starting  Gravitee Gateway deployment" 
    kubectl scale deployment  graviteegatewayservice --namespace=$k8s_namespace --replicas=1  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Starting  Gravitee Management deployment" 
    kubectl scale deployment  graviteemngservice --namespace=$k8s_namespace --replicas=1  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Starting Gravitee UI deployment" 
    kubectl scale deployment  graviteeuiservice --namespace=$k8s_namespace --replicas=1
    sleep 10s  
  fi

  if [[ ${params[9]} == true ]]; then  
    sleep 30s      
    echo "[$(date)] Starting Control Panel deployment" 
    kubectl scale deployment controlpanelservice --namespace=$k8s_namespace --replicas=1
    sleep 400s 
  fi
     
  if [[ ${params[43]} == true ]]; then  
    sleep 30s      
    echo "[$(date)] Starting Graylog deployment" 
    kubectl scale deployment  log-centralizer --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[11]} == true ]]; then    
    echo "[$(date)] Starting Semantic Information Broker deployment" 
    kubectl scale deployment routerservice --namespace=$k8s_namespace --replicas=1  
    sleep 60s
  fi
     
  if [[ ${params[13]} == true ]]; then       
    echo "[$(date)] Starting IoT broker deployment" 
    kubectl scale deployment iotbrokerservice --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[15]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Starting OAuth deployment" 
    kubectl scale deployment oauthservice --namespace=$k8s_namespace --replicas=1  
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Starting Keycloak deployment" 
    kubectl scale deployment keycloak --namespace=$k8s_namespace --replicas=1  
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Starting Keycloak Manager deployment" 
    kubectl scale deployment keycloakmanager --namespace=$k8s_namespace --replicas=1  
  fi
     
  if [[ ${params[17]} == true ]]; then
    sleep 60s    
    echo "[$(date)] Starting API manager deployment" 
    kubectl scale deployment apimanagerservice --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[19]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Starting DashBoard Engine deployment" 
    kubectl scale deployment dashboardengineservice --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[21]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Starting RTDB Maintainer deployment" 
    kubectl scale deployment rtdbmaintainerservice --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[23]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Starting Device Simulator deployment" 
    kubectl scale deployment devicesimulator --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[25]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Starting Monitoring UI deployment" 
    kubectl scale deployment monitoringuiservice --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[27]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Starting Notebooks deployment" 
    kubectl scale deployment zeppelin --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[29]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Starting Streamsets deployment" 
    kubectl scale deployment streamsets --namespace=$k8s_namespace --replicas=1
  fi
  
  if [[ ${params[31]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Starting Flowengine deployment" 
    kubectl scale deployment flowengine --namespace=$k8s_namespace --replicas=1
  fi
  
  if [[ ${params[33]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Starting rules-engine-service deployment" 
    kubectl scale deployment rules-engine-service --namespace=$k8s_namespace --replicas=1
  fi
  
  if [[ ${params[35]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Starting Bpmengine deployment" 
    kubectl scale deployment bpmengine --namespace=$k8s_namespace --replicas=1
  fi
     
  if [[ ${params[37]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Starting Load Balancer deployment" 
    kubectl scale deployment loadbalancer --namespace=$k8s_namespace --replicas=1  
  fi
fi


if [[ ${params[44]} == "stop" ]]; then
  if [[ ${params[3]} == true ]]; then
    sleep 5s
    echo "[$(date)] Stopping configdb deployment" 
    kubectl scale deployment configdb --namespace=$k8s_namespace --replicas=0  
    sleep 10s
    echo "[$(date)] Stopping realtimdb deployment" 
    kubectl scale deployment realtimedb --namespace=$k8s_namespace --replicas=0
    sleep 10s 
    echo "[$(date)] Stopping elasticdb deployment" 
    kubectl scale deployment elasticdb --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[5]} == true ]]; then 
    sleep 10s                 
    echo "[$(date)] Stopping zookeeper deployment" 
    kubectl scale deployment zookeeper --namespace=$k8s_namespace --replicas=0 
  fi
  
  if [[ ${params[7]} == true ]]; then  
    sleep 20s  
    echo "[$(date)] Stopping Cache service" 
    kubectl scale deployment cacheservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[9]} == true ]]; then  
    sleep 30s      
    echo "[$(date)] Stopping Control Panel deployment" 
    kubectl scale deployment controlpanelservice --namespace=$k8s_namespace --replicas=0
    sleep 400s 
  fi
     
  if [[ ${params[11]} == true ]]; then    
    echo "[$(date)] Stopping Semantic Information Broker deployment" 
    kubectl scale deployment routerservice --namespace=$k8s_namespace --replicas=0  
    sleep 60s
  fi
     
  if [[ ${params[13]} == true ]]; then       
    echo "[$(date)] Stopping IoT broker deployment" 
    kubectl scale deployment iotbrokerservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[15]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Stopping OAuth deployment" 
    kubectl scale deployment oauthservice --namespace=$k8s_namespace --replicas=0  
  fi
     
  if [[ ${params[17]} == true ]]; then
    sleep 60s    
    echo "[$(date)] Stopping API manager deployment" 
    kubectl scale deployment apimanagerservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[19]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Stopping DashBoard Engine deployment" 
    kubectl scale deployment dashboardengineservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[21]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Stopping RTDB Maintainer deployment" 
    kubectl scale deployment rtdbmaintainerservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[23]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Stopping Device Simulator deployment" 
    kubectl scale deployment devicesimulator --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[25]} == true ]]; then  
    sleep 60s      
    echo "[$(date)] Stopping Monitoring UI deployment" 
    kubectl scale deployment monitoringuiservice --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[27]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Stopping Notebooks deployment" 
    kubectl scale deployment zeppelin --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[29]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Stopping Streamsets deployment" 
    kubectl scale deployment streamsets --namespace=$k8s_namespace --replicas=0
  fi
  
  if [[ ${params[31]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Stopping Flowengine deployment" 
    kubectl scale deployment flowengine --namespace=$k8s_namespace --replicas=0
  fi
  
  if [[ ${params[33]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Stopping rules-engine-service deployment" 
    kubectl scale deployment rules-engine-service --namespace=$k8s_namespace --replicas=0
  fi
  
  if [[ ${params[35]} == true ]]; then  
    sleep 60s  
    echo "[$(date)] Stopping Bpmengine deployment" 
    kubectl scale deployment bpmengine --namespace=$k8s_namespace --replicas=0
  fi
     
  if [[ ${params[37]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Stopping Load Balancer deployment" 
    kubectl scale deployment loadbalancer --namespace=$k8s_namespace --replicas=0  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Stopping  Gravitee Gateway deployment" 
    kubectl scale deployment  graviteegatewayservice --namespace=$k8s_namespace --replicas=0  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Stopping  Gravitee Management deployment" 
    kubectl scale deployment  graviteemngservice --namespace=$k8s_namespace --replicas=0  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 60s    
    echo "[$(date)] Stopping Gravitee UI deployment" 
    kubectl scale deployment  graviteeuiservice --namespace=$k8s_namespace --replicas=0
    sleep 10s  
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Stopping Keycloak deployment" 
    kubectl scale deployment keycloak --namespace=$k8s_namespace --replicas=0  
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 60s      
    echo "[$(date)] Stopping Keycloak Manager deployment" 
    kubectl scale deployment keycloakmanager --namespace=$k8s_namespace --replicas=0  
  fi

  if [[ ${params[43]} == true ]]; then  
    sleep 30s      
    echo "[$(date)] Stopping Graylog deployment" 
    kubectl scale deployment  log-centralizer --namespace=$k8s_namespace --replicas=0
  fi
fi

if [[ ${params[44]} == "status" ]]; then
  if [[ ${params[3]} == true ]]; then
    sleep 2s
    echo "[$(date)] Configdb status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'configdb' | awk {'print $3'}  
    sleep 2s
    echo "[$(date)] Realtimedb status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'realtimedb' | awk {'print $3'}  
    sleep 2s  
    echo "[$(date)] Elasticdb status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'elastidb' | awk {'print $3'}  
  fi
     
  if [[ ${params[5]} == true ]]; then 
    sleep 2s                 
    echo "[$(date)] Zookeeper status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'zookeeper' | awk {'print $3'}  
  fi
  
  if [[ ${params[7]} == true ]]; then  
    sleep 2s                 
    echo "[$(date)] Cacheservice status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'cacheservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[9]} == true ]]; then  
    sleep 2s                 
    echo "[$(date)] Controlpanel status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'controlpanel' | awk {'print $3'}  
  fi
     
  if [[ ${params[11]} == true ]]; then    
    sleep 2s                 
    echo "[$(date)] Router status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'routerservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[13]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Iot-broker status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'iotbrokerservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[15]} == true ]]; then    
    sleep 2s     
    echo "[$(date)] Oauthservice status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'oauthservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[17]} == true ]]; then
    sleep 2s     
    echo "[$(date)] Apimanager status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'apimanagerservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[19]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Dashboard status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'dashboardengineservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[21]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] RTDB status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'rtdbmaintainerservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[23]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Devicesimulator status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'devicesimulator' | awk {'print $3'}  
  fi
     
  if [[ ${params[25]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Monitoringui status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'monitoringuiservice' | awk {'print $3'}  
  fi
     
  if [[ ${params[27]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Notebook status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'zeppelin' | awk {'print $3'}  
  fi
     
  if [[ ${params[29]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Streamsets status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'streamsets' | awk {'print $3'}  
  fi
  
  if [[ ${params[31]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Flowengine status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'flowengine' | awk {'print $3'}  
  fi
  
  if [[ ${params[33]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Rules-engine status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'rules-engine-service' | awk {'print $3'}  
  fi
  
  if [[ ${params[35]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] BPM status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'bpmengine' | awk {'print $3'}  
  fi
     
  if [[ ${params[37]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Loadbalancer status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'loadbalancer' | awk {'print $3'}  
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Gravitee Gateway status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'graviteegatewayservice' | awk {'print $3'}
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Gravitee Manager status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'graviteemngservice' | awk {'print $3'}
  fi

  if [[ ${params[39]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Gravitee UI status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'graviteeuiservice' | awk {'print $3'}
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 2s     
    echo "[$(date)] Keycloak status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'keycloak' | awk {'print $3'}
  fi

  if [[ ${params[41]} == true ]]; then    
    sleep 2s     
    echo "[$(date)] Keycloak Manager status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'keycloakmanager' | awk {'print $3'}
  fi

  if [[ ${params[43]} == true ]]; then  
    sleep 2s     
    echo "[$(date)] Graylog status" 
    kubectl get pods --namespace=$k8s_namespace | grep 'log-centralizer' | awk {'print $3'}
  fi
fi
