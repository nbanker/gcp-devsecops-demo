# GCP GitOps Demo with ArgoCD and Datadog

## Overview

This repository is an exploration of GitOps principles using **ArgoCD** for continuous delivery and **Datadog** for observability within a **Google Kubernetes Engine (GKE)** environment. The project adheres to **DevSecOps best practices**, emphasizing secure infrastructure provisioning, auditability, and separation of concerns.

The goal is to:

* Automate infrastructure provisioning with **Terraform**
* Deploy applications through **GitOps** workflows
* Integrate **Datadog agents** for monitoring
* Structure the codebase to allow easy extension and modularity

---

## Project Structure

ArgoCD itself is provisioned **within the GKE cluster using Terraform** under the `argocd-infra` module. This allows GitOps tooling to be deployed declaratively alongside the infrastructure and supports seamless bootstrapping of the GitOps pipeline.

### Infrastructure Code

```
.
├── argocd-infra
│   ├── helm.tf                 # Helm provider config for ArgoCD installation
│   ├── kube-namespace.tf       # Kubernetes namespace definitions
│   └── outputs.tf              # Output variables for ArgoCD module
├── automation
│   ├── input.tf                # Shared variables
│   ├── main.tf                 # Orchestration of all modules
│   ├── outputs.tf              # Global outputs for the stack
│   ├── terraform.tf            # Backend and provider setup
│   ├── terraform.tfstate       
│   ├── terraform.tfstate.backup
│   └── variables.dev.tfvars    # tfvars for dev environment
└── gcp-infra
    ├── client-config.tf        # GCP authentication and project setup
    ├── gke.tf                  # GKE cluster definition
    ├── iam.tf                  # IAM roles and service accounts
    ├── input.tf                # Module inputs
    ├── network.tf              # Subnet, secondary ranges, and firewall rules
    └── outputs.tf              # Output values for cross-module usage
```

### GitOps App Repo

```
.
├── app
│   ├── datadog-agent
│   │   └── datadog-values.yaml     # Values override for Helm Datadog agent (will be moved)
│   └── nginx
│       ├── deployment.yaml        # Simple NGINX deployment
│       ├── kustomization.yaml     # Kustomize manifest
│       └── service.yaml           # ClusterIP service
├── apps
│   └── argocd
│       ├── nginx-app.yaml         # ArgoCD Application manifest
│       └── sealed-secrets.yaml   # Encrypted secrets using SealedSecrets
└── README.md
```

---

## DevSecOps Considerations

* **Principle of Least Privilege**: IAM roles and Kubernetes RBAC are tightly scoped.
* **GitOps**: Declarative deployments and infrastructure definitions stored in Git.
* **Sealed Secrets**: Secrets are encrypted and can be safely committed.
* **Observability**: Datadog is deployed via Helm and automatically monitors all cluster nodes.
* **Separation of Concerns**: Infrastructure and application repositories are decoupled.

---

## Setup Instructions

1. **Bootstrap Infrastructure**:

   ```sh
   cd automation
   terraform init
   terraform apply -var-file=variables.dev.tfvars
   ```
2. **Install ArgoCD**:

   ```sh
   cd argocd-infra
   terraform apply
   ```
3. **Deploy Applications via GitOps**:

   * Push manifests to the `gcp-demo-nginx-app` repo
   * ArgoCD will sync and deploy `nginx` and `datadog-agent`

---

## Future Improvements

* Move **Datadog Agent** out of the application GitOps repo to an **infra GitOps repo**:

  * ✅ Keeps infrastructure concerns separate from application logic
  * ✅ Avoids duplication across multiple app repos
  * ✅ Enables better control over cluster-wide observability
* Add CI/CD pipeline for Terraform linting and plan validation
* Enhance GitOps repo with more realistic microservices
* Set up alerting rules and dashboards in Datadog
* Add network policies and pod security policies for enhanced isolation

