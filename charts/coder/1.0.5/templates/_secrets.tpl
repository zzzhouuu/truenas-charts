{{/* Define the secrets */}}
{{- define "postgres.secrets" -}}
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: postgres-credentials
data:
  CODER_PG_CONNECTION_URL: {{ (printf "postgres://%v:%v@%v:%v/%v?sslmode=disable" .Values.database.username .Values.database.password .Values.database.host .Values.database.port .Values.database.name) | b64enc }}
{{- end -}}
