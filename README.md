## Helm plugin to deploy the platform pods

It allows us to start the pods in an easy and simple way.

Requirements:

- Helm v3 installed
- oc cli installed

### Plugin installation

```
> helm plugin install https://cicd.onesaitplatform.com/gitlab/onesait-platform/helm-autostart.git
```

### Uninstall

```
> helm plugin uninstall autostart
```

### List plugins

```
> helm plugin list
```

### Plugin usage:

- Available flags:
  - k8s_namesapce: namespace which contents the OP deployments
  - persistence: enables persistence pods deployment
  - op_modules: enables op_modules pods deployment
  - configinti: enables configinit pod deployment, wait 5 minutes and scale it to zero again

```
> helm autostart --k8s_namespace <namespace_name> --peristence <true/false> --configinit <true/false> --zookeeper <true/false> --cacheservice <true/false> --controlpanel <true/false> --router <true/false> --iotbroker <true/false> --oauth <true/false> --apimanager <true/false> --dashboard <true/false> --rtdbmaintainer <true/false> --devicesimulator <true/false> --monitoringui <true/false> --notebooks <true/false> --dataflow <true/false> --flowengine <true/false> --rulesengine <true/false> --bpmengine <true/false> --loadbalancer <true/false> <start/stop/status>
```

Once the plugin execution is finished, the platform pods will be scaled.

