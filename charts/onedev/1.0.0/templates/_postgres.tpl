{{/*
Get Postgres Database Name
*/}}
{{- define "postgres.databaseName" -}}
{{- print "onedev" -}}
{{- end -}}


{{/*
Retrieve Postgres secret name
*/}}
{{- define "postgres.secretName" -}}
{{- print "postgres-secret" -}}
{{- end -}}


{{- define "postgres.imageName" -}}
{{- print "postgres:13.6" -}}
{{- end -}}


{{/*
Retrieve postgres backup name
This will return a unique name based on revision and chart numbers specified.
*/}}
{{- define "postgres.backupName" -}}
{{- $upgradeDict := .Values.ixChartContext.upgradeMetadata -}}
{{- printf "postgres-backup-from-%s-to-%s-revision-%d" $upgradeDict.oldChartVersion $upgradeDict.newChartVersion (int64 $upgradeDict.preUpgradeRevision) -}}
{{- end }}


{{/*
Retrieve postgres credentials for environment variables configuration
*/}}
{{- define "postgres.envVariableConfiguration" -}}
{{ $envList := list }}
{{ $envList = mustAppend $envList (dict "name" "POSTGRES_DB" "valueFromSecret" true "secretName" (include "postgres.secretName" .) "secretKey"  "db-name") }}
{{ $envList = mustAppend $envList (dict "name" "POSTGRES_USER" "valueFromSecret" true "secretName" (include "postgres.secretName" .) "secretKey" "db-user") }}
{{ $envList = mustAppend $envList (dict "name" "POSTGRES_PASSWORD" "valueFromSecret" true "secretName" (include "postgres.secretName" .) "secretKey"  "db-password") }}
{{ include "common.containers.environmentVariables" (dict "environmentVariables" $envList) }}
{{- end -}}


{{/*
Retrieve postgres volume configuration
*/}}
{{- define "postgres.volumeConfiguration" -}}
{{ include "common.storage.configureAppVolumes" (dict "appVolumeMounts" .Values.postgresAppVolumeMounts "emptyDirVolumes" .Values.emptyDirVolumes "ixVolumes" .Values.ixVolumes) | nindent 0 }}
{{- end -}}


{{/*
Retrieve postgres volume mounts configuration
*/}}
{{- define "postgres.volumeMountsConfiguration" -}}
{{ include "common.storage.configureAppVolumeMountsInContainer" (dict "appVolumeMounts" .Values.postgresAppVolumeMounts ) | nindent 0 }}
{{- end -}}

