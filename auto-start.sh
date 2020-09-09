#!/bin/bash

#
# Copyright Indra Sistemas, S.A.
# 2013-2019 SPAIN
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ------------------------------------------------------------------------

# Defining standard output colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

# Load configuration file
source $HELM_PLUGIN_DIR/config.properties

if [ "$1" = "start" ]; then
	                   
	echo "[$(date)] Starting quasar deployment" >> /var/log/onesait.log
	kubectl scale deployment quasar --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 10s

	echo "[$(date)] Starting Cache service" >> /var/log/onesait.log
	kubectl scale deployment cacheservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log
	  
	sleep 30s  
	    
	echo "[$(date)] Starting Control Panel deployment" >> /var/log/onesait.log
	kubectl scale deployment controlpanelservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log
	  
	sleep 400s 
	   
	echo "[$(date)] Starting Semantic Information Broker deployment" >> /var/log/onesait.log
	kubectl scale deployment routerservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	        
	echo "[$(date)] Starting IoT broker deployment" >> /var/log/onesait.log
	kubectl scale deployment iotbrokerservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log
	    
	sleep 60s
	          
	echo "[$(date)] Starting OAuth deployment" >> /var/log/onesait.log
	kubectl scale deployment oauthservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s    
	    
	echo "[$(date)] Starting API manager deployment" >> /var/log/onesait.log
	kubectl scale deployment apimanagerservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	    
	echo "[$(date)] Starting DashBoard Engine deployment" >> /var/log/onesait.log
	kubectl scale deployment dashboardengineservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	        
	echo "[$(date)] Starting RTDB Maintainer deployment" >> /var/log/onesait.log
	kubectl scale deployment rtdbmaintainerservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	        
	echo "[$(date)] Starting Device Simulator deployment" >> /var/log/onesait.log
	kubectl scale deployment devicesimulator --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	#sleep 60s

	#echo "[$(date)] Starting Device Simulator deployment" >> /var/log/onesait.log
	#kubectl scale deployment flowengineservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	        
	echo "[$(date)] Starting Monitoring UI deployment" >> /var/log/onesait.log
	kubectl scale deployment monitoringuiservice --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	    
	echo "[$(date)] Starting Notebooks deployment" >> /var/log/onesait.log
	kubectl scale deployment zeppelin --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log
	 
	sleep 60s    

	echo "[$(date)] Starting Streamsets deployment" >> /var/log/onesait.log
	kubectl scale deployment streamsets --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Starting Streamsets-secondary deployment" >> /var/log/onesait.log
	kubectl scale deployment streamsets-secondary --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

	sleep 60s
	    
	echo "[$(date)] Starting Load Balancer deployment" >> /var/log/onesait.log
	kubectl scale deployment loadbalancer --namespace=$OP_NAMESPACE --replicas=1 2>&1 >> /var/log/onesait.log

fi

if [ "$1" = "stop" ]; then

	echo "[$(date)] Stopping quasar deployment" >> /var/log/onesait.log
	kubectl scale deployment quasar --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping Cache service" >> /var/log/onesait.log
	kubectl scale deployment cacheservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping Control Panel deployment" >> /var/log/onesait.log
	kubectl scale deployment controlpanelservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 50s

	echo "[$(date)] Stopping Semantic Information Broker deployment" >> /var/log/onesait.log
	kubectl scale deployment routerservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping IoT broker deployment" >> /var/log/onesait.log
	kubectl scale deployment iotbrokerservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping OAuth deployment" >> /var/log/onesait.log
	kubectl scale deployment oauthservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping API manager deployment" >> /var/log/onesait.log
	kubectl scale deployment apimanagerservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping DashBoard Engine deployment" >> /var/log/onesait.log
	kubectl scale deployment dashboardengineservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping RTDB Maintainer deployment" >> /var/log/onesait.log
	kubectl scale deployment rtdbmaintainerservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping Device Simulator deployment" >> /var/log/onesait.log
	kubectl scale deployment devicesimulator --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping Monitoring UI deployment" >> /var/log/onesait.log
	kubectl scale deployment monitoringuiservice --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 5s

	echo "[$(date)] Stopping Notebooks deployment" >> /var/log/onesait.log
	kubectl scale deployment zeppelin --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping Streamsets deployment" >> /var/log/onesait.log
	kubectl scale deployment streamsets --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping Streamsets2 deployment" >> /var/log/onesait.log
	kubectl scale deployment streamsets2 --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

	sleep 60s

	echo "[$(date)] Stopping Load Balancer deployment" >> /var/log/onesait.log
	kubectl scale deployment loadbalancer --namespace=$OP_NAMESPACE --replicas=0 2>&1 >> /var/log/onesait.log

fi

