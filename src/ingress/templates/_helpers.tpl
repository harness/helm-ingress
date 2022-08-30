{* {{ define "harness.ingress" }}
{{ printf "app- %s\n" .app }}
{{ printf "global- %s" .global }}
{{- $app := $.app }}
{{- if $app.enabled }}
apiVersion: {{ include "common.capabilities.ingress.apiVersion" . }}
kind: Ingress
metadata:
  name: access-control
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "access-control.labels" . | nindent 4 }}
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$2
    nginx.ingress.kubernetes.io/proxy-read-timeout: "300"
    {{- if .Values.ingress.annotations }}
    {{- include "common.tplvalues.render" (dict "value" .app.annotations "context" $) | nindent 4 }}
    {{- end }}
spec:
  {{- if and .root.global.ingress.ingressClassName (include "common.ingress.supportsIngressClassname" .) }}
  ingressClassName: {{ .root.global.ingress.ingressClassName | quote }}
  {{- end }}
  rules:
    {{- if .root.global.ingress.hostname }}
    - host: {{ .root.global.ingress.hostname }}
      http:
        paths:
          {{- if .app.extraPaths }}
          {{- toYaml .app.extraPaths | nindent 10 }}
          {{- end }}
          - path: {{ .app.path }}
            {{- if eq "true" (include "common.ingress.supportsPathType" .) }}
            pathType: {{ .app.pathType }}
            {{- end }}
            backend: {{- include "common.ingress.backend" (dict "serviceName" "access-control" "servicePort" .app.servicePort "context" $)  | nindent 14 }}
    {{- end }}
    {{- range .app.extraHosts }}
    - host: {{ .name | quote }}
      http:
        paths:
          - path: {{ default "/" .path }}
            {{- if eq "true" (include "common.ingress.supportsPathType" $) }}
            pathType: {{ default "ImplementationSpecific" .pathType }}
            {{- end }}
            backend: {{ include "common.ingress.backend" (dict "serviceName" "backendName" "servicePort" "backendPort" "context" $) | nindent 14}}
    {{- end }}
    {{- if .app.extraRules }}
    {{- include "common.tplvalues.render" (dict "value" .app.extraRules "context" $) | nindent 4 }}
    {{- end }}
  {{- if or .app.tls .app.extraTls }}
  tls:
    {{- if .app.tls }}
    - hosts:
        - {{ .root.global.ingress.hostname }}
      secretName: {{ printf "%s-tls" .root.global.ingress.hostname }}
    {{- end }}
    {{- if .app.extraTls }}
    {{- include "common.tplvalues.render" ( dict "value" .app.extraTls "context" $ ) | nindent 4 }}
    {{- end }}
  {{- end }}
{{- end }}
{{ end }} *}
