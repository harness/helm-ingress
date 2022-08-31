{{/*
Common labels
*/}}
{{- define "ingress.labels" -}}
{{ printf "app.kubernetes.io/name: %s" .name }}
{{- end }}

## global - global object
## name - name of module
## settings - map of settings
## context - .Values
{{ define "harness.ingress" }}
{{- if .global.ingress.enabled -}}
{{- $svcPort := .settings.servicePort -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ .name }}
  namespace: {{ .Release.Namespace }}
  labels: 
  {{ include "ingress.labels" (dict "name" .name) | indent 2 }}
  {{- with .settings.annotations }}
  annotations: {{ toYaml .| nindent 4 }}
  {{- end }}
spec:
  rules:
    - host: {{ .global.ingress.hostname }}  
      http:
        paths:
          - path: {{ .settings.path }}
            pathType: {{ .settings.pathType }}
            backend:
              service:
                name: {{ .name }}
                port:
                  number: {{ $svcPort }}
{{- end }}
{{- end }}