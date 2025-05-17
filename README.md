# Langfuse Helm Chart

This Helm chart deploys [Langfuse](https://www.langfuse.com/) version 3.x on Kubernetes.

## Features

- Langfuse backend and frontend
- PostgreSQL integrated (optional external DB supported)
- Ingress with TLS support
- Secrets templated
- GitOps-friendly

## Install

```bash
helm repo add langfuse https://erickmpene.github.io/langfuse-helm-chart
helm install langfuse langfuse/langfuse -f values.yaml



