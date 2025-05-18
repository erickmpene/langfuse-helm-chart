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


> ⚠️ **Important**: Even if a namespace is created this way, Helm will still deploy resources to the namespace defined by `--namespace`.  
> If `--namespace` and `.Values.namespace.name` differ, **Helm uses `--namespace`**, and the one defined in `values.yaml` is only created but left empty.

---

## 🗄️ Persistent Volume Requirements

This chart requires that a `StorageClass` named `nfs-prod` is available in your cluster before deploying Langfuse.

All services (PostgreSQL, Redis, MinIO, ClickHouse) rely on this StorageClass to dynamically provision their PersistentVolumeClaims (PVCs).

### 🔧 Example: check if `nfs-prod` exists

```bash
kubectl get storageclass

