# qbittorrent

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

The Qbittorrent project aims to provide an open-source software alternative to µTorrent.

**Homepage:** <https://www.qbittorrent.org>

## Source Code

* <https://github.com/qbittorrent/qBittorrent>
* <https://hub.docker.com/r/linuxserver/qbittorrent>

## Requirements

Kubernetes: `>= 1.19.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.truecharts.org | common | 10.5.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/qbittorrent"` |  |
| image.tag | string | `"latest"` |  |
| ingress.main.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `true` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| persistence.downloads.enabled | bool | `false` |  |
| persistence.downloads.mountPath | string | `"/downloads"` |  |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| service.main.ports.main.port | int | `8080` |  |
| service.main.ports.main.targetPort | int | `8080` |  |
| service.torrent.enabled | bool | `true` |  |
| service.torrent.ports.torrent.enabled | bool | `true` |  |
| service.torrent.ports.torrent.port | int | `6881` |  |
| service.torrent.ports.torrent.targetPort | int | `6881` |  |
| service.torrentudp.enabled | bool | `true` |  |
| service.torrentudp.ports.torrentudp.enabled | bool | `true` |  |
| service.torrentudp.ports.torrentudp.port | int | `6881` |  |
| service.torrentudp.ports.torrentudp.protocol | string | `"UDP"` |  |
| service.torrentudp.ports.torrentudp.targetPort | int | `6881` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
