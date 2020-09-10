## Helm plugin for self signed certificates generation

This plugin allows to generate self signed certificates, additionally generates and deploys Openshift route manifest file including complete certificate chain and private key.

Requirements:

- Helm v3 installed
- oc cli installed
- OpenSSL installed

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
  - namesapce: namespace which contents the OP deployments

```
> helm autostart --namespace <op_namespace>
```

Once the plugin execution is finished, the platform pods will be scaled.

