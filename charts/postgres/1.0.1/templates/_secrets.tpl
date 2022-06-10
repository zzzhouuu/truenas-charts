{{/* Define the secrets */}}
{{- define "postgres.secrets" -}}
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: postgres-secrets
{{- $previousSecrets := lookup "v1" "Secret" .Release.Namespace "postgres-secrets" }}
{{- $password := "" }}
data:
  {{- if $previousSecrets}}
  postgres-password: {{ index $previousSecrets.data "postgres-password" }}
  {{- else }}
  {{- $password := ( .Values.postgresPassword | default (randAlphaNum 15) ) }}
  postgres-password: {{ $password | b64enc }}
  {{- end }}

{{- end -}}
