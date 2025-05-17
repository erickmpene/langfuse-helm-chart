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

 

## 📦 Namespace Management

By default, this chart does **not hardcode any Kubernetes namespace** into the templates. You are expected to define the target namespace **at install time** using the `--namespace` flag.

### ✅ Recommended installation

```bash
helm install langfuse ./langfuse \
  --namespace langfuse \
  --create-namespace
```

This will deploy all resources into the `langfuse` namespace. The namespace will be created automatically if it doesn't exist.

---

### ⚙️ Optional: Auto-create a namespace from `values.yaml`

If you prefer, you can instruct the chart to create a namespace by setting the following in `values.yaml`:

```yaml
namespace:
  create: true
  name: langfuse
```

> ⚠️ **Important**: Even if a namespace is created this way, Helm will still deploy resources to the namespace defined by `--namespace`.  
> If `--namespace` and `.Values.namespace.name` differ, **Helm uses `--namespace`**, and the one defined in `values.yaml` is only created but left empty.

---

### ❌ Do not hardcode `namespace:` in templates

This chart follows Helm best practices by not explicitly setting `metadata.namespace` in resource manifests. Helm handles namespace assignment automatically at deployment time.