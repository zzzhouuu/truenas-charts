{{- define "ondev.configmap" -}}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-config
  labels:
    {{- include "common.labels" . | nindent 4 }}
data:
  k8s_service: '{{ default ( include "common.names.fullname" . ) }}'
  {{- if .Values.ingress.main.enabled }} 
  ingress_host: "{{ .Values.ingress.main.enabled }}" 
  {{- end }}
  {{- if .Values.useEmbeddedDatabase }}
  hibernate_dialect: org.hibernate.dialect.HSQLDialect
  hibernate_connection_driver_class: org.hsqldb.jdbc.JDBCDriver
  hibernate_connection_url: jdbc:hsqldb:file:${installDir}/sampledb/onedev;hsqldb.tx=mvcc;hsqldb.lob_compressed=true;sql.ignore_case=true;shutdown=true
  hibernate_connection_username: sa
  hibernate_connection_password: ''
  {{- else }}
  hibernate_dialect: "{{ .Values.hibernateDialect }}" 
  hibernate_connection_driver_class: "{{ .Values.hibernateConnectionDriverClass }}" 
  hibernate_connection_url: "{{ .Values.hibernateConnectionUrl }}" 
  hibernate_connection_username: "{{ .Values.hibernateConnectionUsername }}" 
  hibernate_connection_password: "{{ .Values.hibernateConnectionPassword }}" 
  {{- end }}
  hibernate_hikari_maximumPoolSize: "{{ .Values.hibernateHikariMaximumPoolSize }}" 
{{- end -}}
