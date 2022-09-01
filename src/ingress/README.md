# ingress

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.ingress.enabled | bool | `true` |  |
| global.ingress.hostname | string | `"blah.foo.com"` |  |
| global.ingress.ingressClassName | string | `""` |  |
| modules[0].access-control.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| modules[0].access-control.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2'"` |  |
| modules[0].access-control.path | string | `"/authz(/|$)(.*)"` |  |
| modules[0].access-control.servicePort | int | `9006` |  |
| modules[10].next-gen-ui.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[10].next-gen-ui.path | string | `"/ng(/|$)(.*)"` |  |
| modules[10].next-gen-ui.servicePort | int | `80` |  |
| modules[11].ng-manager.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[11].ng-manager.path | string | `"/ng/api(/|$)(.*)"` |  |
| modules[11].ng-manager.servicePort | int | `7090` |  |
| modules[12].pipeline-service.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[12].pipeline-service.path | string | `"/pipeline(/|$)(.*)"` |  |
| modules[12].pipeline-service.servicePort | int | `12001` |  |
| modules[13].platform-service.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| modules[13].platform-service.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[13].platform-service.extraPaths[0].backend.service.name | string | `"platform-service"` |  |
| modules[13].platform-service.extraPaths[0].backend.service.port.number | int | `9005` |  |
| modules[13].platform-service.extraPaths[0].path | string | `"/audit(/|$)(.*)"` |  |
| modules[13].platform-service.extraPaths[0].pathType | string | `"ImplementationSpecific"` |  |
| modules[13].platform-service.extraPaths[1].backend.service.name | string | `"platform-service"` |  |
| modules[13].platform-service.extraPaths[1].backend.service.port.number | int | `9005` |  |
| modules[13].platform-service.extraPaths[1].path | string | `"/resourcegroup(/|$)(.*)"` |  |
| modules[13].platform-service.extraPaths[1].pathType | string | `"ImplementationSpecific"` |  |
| modules[13].platform-service.path | string | `"/notifications(/|$)(.*)"` |  |
| modules[13].platform-service.servicePort | int | `9005` |  |
| modules[14].sto-core.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[14].sto-core.path | string | `"/sto(/|$)(.*)"` |  |
| modules[14].sto-core.servicePort | int | `4000` |  |
| modules[15].sto-manager.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[15].sto-manager.path | string | `"/sto-manager(/|$)(.*)"` |  |
| modules[15].sto-manager.servicePort | int | `7090` |  |
| modules[16].template-service.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[16].template-service.path | string | `"/template(/|$)(.*)"` |  |
| modules[16].template-service.servicePort | int | `15002` |  |
| modules[17].ti-service.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[17].ti-service.path | string | `"/ti-service(/|$)(.*)"` |  |
| modules[17].ti-service.servicePort | int | `8078` |  |
| modules[1].ci-manager.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2'"` |  |
| modules[1].ci-manager.path | string | `"/ci(/|$)(.*)"` |  |
| modules[1].ci-manager.servicePort | int | `7090` |  |
| modules[2].cv-nextgen.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2'"` |  |
| modules[2].cv-nextgen.path | string | `"/cv/api(/|$)(.*)"` |  |
| modules[2].cv-nextgen.servicePort | int | `6060` |  |
| modules[3].gateway.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2'"` |  |
| modules[3].gateway.path | string | `"/gateway(/|$)(.*)"` |  |
| modules[3].gateway.servicePort | int | `80` |  |
| modules[4].harness-manager.annotations | object | `{}` |  |
| modules[4].harness-manager.extraPaths[0].backend.service.name | string | `"harness-manager"` |  |
| modules[4].harness-manager.extraPaths[0].backend.service.port.number | int | `9090` |  |
| modules[4].harness-manager.extraPaths[0].path | string | `"/stream"` |  |
| modules[4].harness-manager.extraPaths[0].pathType | string | `"ImplementationSpecific"` |  |
| modules[4].harness-manager.path | string | `"/api"` |  |
| modules[4].harness-manager.servicePort | int | `9090` |  |
| modules[5].delegate-proxy.annotations | object | `{}` |  |
| modules[5].delegate-proxy.path | string | `"/storage"` |  |
| modules[5].delegate-proxy.servicePort | int | `80` |  |
| modules[6].log-service.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[6].log-service.path | string | `"/log-service(/|$)(.*)"` |  |
| modules[6].log-service.servicePort | int | `8079` |  |
| modules[7].login.annotations | object | `{}` |  |
| modules[7].login.path | string | `"/"` |  |
| modules[7].login.servicePort | int | `80` |  |
| modules[8].minio.annotations | object | `{}` |  |
| modules[8].minio.extraPaths[0].backend.service.name | string | `"minio"` |  |
| modules[8].minio.extraPaths[0].backend.service.port.number | int | `9001` |  |
| modules[8].minio.extraPaths[0].path | string | `"/minio"` |  |
| modules[8].minio.extraPaths[0].pathType | string | `"ImplementationSpecific"` |  |
| modules[8].minio.path | string | `"/logs"` |  |
| modules[8].minio.servicePort | int | `9000` |  |
| modules[9].ng-auth-ui.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| modules[9].ng-auth-ui.path | string | `"/auth(/|$)(.*)"` |  |
| modules[9].ng-auth-ui.servicePort | int | `80` |  |

