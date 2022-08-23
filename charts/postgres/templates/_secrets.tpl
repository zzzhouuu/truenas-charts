{{/* Define the secrets */}}
{{- define "postgres.secrets" -}}
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: postgres-credentials
{{- $previousSecrets := lookup "v1" "Secret" .Release.Namespace "postgres-credentials" }}
{{- $password := "" }}
data:
  {{- if $previousSecrets}}
  postgres-username: {{ index $previousSecrets.data "postgres-username" }}
  postgres-password: {{ index $previousSecrets.data "postgres-password" }}
  {{- else }}
  postgres-username: {{ .Values.postgresUsername | default "postgres" | b64enc }}
  postgres-password: {{ .Values.postgresPassword | default (randAlphaNum 15) | b64enc }}
  {{- end }}
{{- end -}}
