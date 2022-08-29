{{/* Define the secrets */}}
{{- define "vaultwarden.secrets" -}}

{{- $adminToken := "" }}
{{- if eq .Values.vaultwarden.admin.enabled true }}
{{- $adminToken = .Values.vaultwarden.admin.token | default (randAlphaNum 48) | b64enc | quote }}
{{- end -}}

{{- $smtpUser := "" }}
{{- if and (eq .Values.vaultwarden.smtp.enabled true ) (.Values.vaultwarden.smtp.user) }}
{{- $smtpUser = .Values.vaultwarden.smtp.user | b64enc | quote }}
{{- end -}}

{{- $yubicoClientId := "" }}
{{- if eq .Values.vaultwarden.yubico.enabled true }}
{{- $yubicoClientId = required "Yubico Client ID required" .Values.vaultwarden.yubico.clientId | toString | b64enc | quote }}
{{- end -}}
---

apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-secret
data:
  {{- if ne $adminToken "" }}
  ADMIN_TOKEN: {{ $adminToken }}
  {{- end }}
  {{- if ne $smtpUser "" }}
  SMTP_USERNAME: {{ $smtpUser }}
  SMTP_PASSWORD: {{ required "Must specify SMTP password" .Values.vaultwarden.smtp.password | b64enc | quote }}
  {{- end }}
  {{- if ne $yubicoClientId "" }}
  YUBICO_CLIENT_ID: {{ $yubicoClientId }}
  YUBICO_SECRET_KEY: {{ required "Yubico Secret Key required" .Values.vaultwarden.yubico.secretKey | b64enc | quote }}
  {{- end }}
  {{- if eq .Values.database.type "postgresql" }}
  DATABASE_URL: {{ (printf "postgres://%v:%v@%v:%v/%v?sslmode=disable" .Values.database.username .Values.database.password .Values.database.host .Values.database.port .Values.database.name) | b64enc }}
  {{- end }}
  {{- if eq .Values.database.type "mysql" }}
  DATABASE_URL: {{ (printf "mysql://%v:%v@%v:%v/%v" .Values.database.username .Values.database.password .Values.database.host .Values.database.port .Values.database.name) | b64enc }}
  {{- end }}
{{- end -}}
