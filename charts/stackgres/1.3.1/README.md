# stackgres

![Version: 1.3.1](https://img.shields.io/badge/Version-1.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.1](https://img.shields.io/badge/AppVersion-1.3.1-informational?style=flat-square)

StackGres is a full-stack PostgreSQL distribution for Kubernetes, packed into an easy deployment unit.

**Homepage:** <https://stackgres.io>

## Source Code

* <https://gitlab.com/ongresinc/stackgres>
* <https://github.com/ongres/stackgres>

## Requirements

Kubernetes: `1.18.0-0 - 1.24.x-O`

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.truecharts.org | common | 10.7.0 |
| https://stackgres.io/downloads/stackgres-k8s/stackgres/helm | stackgres-operator | 1.3.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.main.enabled | bool | `false` |  |
| service.main.ports.main.port | int | `443` |  |
| service.main.ports.main.targetPort | string | `"https"` |  |
| stackgres-operator.adminui.service.loadBalancerIP | string | `nil` |  |
| stackgres-operator.adminui.service.nodePort | string | `nil` |  |
| stackgres-operator.adminui.service.type | string | `"ClusterIP"` |  |
| stackgres-operator.authentication.password | string | `""` |  |
| stackgres-operator.authentication.user | string | `"admin"` |  |
| stackgres-operator.grafana.autoEmbed | bool | `false` |  |
| stackgres-operator.grafana.dashboardId | string | `""` |  |
| stackgres-operator.grafana.datasourceName | string | `"Prometheus"` |  |
| stackgres-operator.grafana.password | string | `nil` |  |
| stackgres-operator.grafana.schema | string | `"http"` |  |
| stackgres-operator.grafana.secretName | string | `nil` |  |
| stackgres-operator.grafana.secretNamespace | string | `nil` |  |
| stackgres-operator.grafana.secretPasswordKey | string | `nil` |  |
| stackgres-operator.grafana.secretUserKey | string | `nil` |  |
| stackgres-operator.grafana.user | string | `nil` |  |
| stackgres-operator.grafana.webHost | string | `nil` |  |
| stackgres-operator.prometheus.allowAutobind | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)