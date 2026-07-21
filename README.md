# 🚀 Trend Application - End-to-End DevSecOps CI/CD Pipeline

## 📌 Project Overview

This project demonstrates the implementation of an end-to-end DevSecOps CI/CD pipeline for deploying a React-based web application on Kubernetes running in AWS.

The objective of this project is to automate the complete software delivery lifecycle—from source code management and containerization to continuous integration, continuous deployment, monitoring, and autoscaling—using industry-standard DevOps tools and practices.

The application is packaged as a Docker image, scanned for security vulnerabilities, stored in a container registry, and automatically deployed to an Amazon EKS cluster using Jenkins pipelines and Helm.

---

# 🏗️ Architecture

> *(Architecture diagram will be added here)*

```
Developer
    │
    ▼
GitHub Repository
    │
Webhook Trigger
    ▼
Jenkins CI Pipeline
    │
├── Workspace Cleanup
├── Checkout Source
├── Environment Validation
├── Docker Build
├── Trivy Security Scan
└── Push Docker Image
    │
    ▼
Docker Hub
    │
    ▼
Jenkins CD Pipeline
    │
├── Workspace Cleanup
├── Checkout Deployment Files
├── Environment Validation
├── Helm Deployment
└── Rollout Verification
    │
    ▼
Amazon EKS
    │
├── Deployment
├── ReplicaSet
├── Pods
├── Service
└── Horizontal Pod Autoscaler
    │
    ▼
Prometheus
    │
    ▼
Grafana
```

---

# 🛠️ Technology Stack

| Category | Technologies |
|----------|--------------|
| Cloud | AWS |
| Infrastructure | Terraform |
| Source Control | Git, GitHub |
| CI/CD | Jenkins |
| Containerization | Docker |
| Container Registry | Docker Hub |
| Container Orchestration | Kubernetes (Amazon EKS) |
| Package Management | Helm |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Security Scanning | Trivy |
| Operating System | Ubuntu Linux |
| Scripting | Bash |

---

# ✨ Key Features

- Infrastructure provisioning using Terraform
- Dockerized React application
- Automated CI pipeline using Jenkins
- Security vulnerability scanning using Trivy
- Docker image versioning and publishing to Docker Hub
- Automated CD pipeline using Jenkins
- Kubernetes deployment using Helm
- Rolling application updates
- Resource Requests and Limits
- Horizontal Pod Autoscaler (HPA)
- Cluster monitoring using Prometheus
- Dashboard visualization using Grafana
- GitHub Webhook integration for automatic CI execution

---

# 📂 Repository Structure

```text
Trend/
│
├── app/
├── docker/
├── helm/
├── jenkins/
├── k8s/
├── scripts/
├── terraform/
├── .github/
├── README.md
└── .dockerignore
```

---

# ⚙️ Infrastructure Provisioning

Infrastructure is provisioned using Terraform.

The infrastructure includes:

- Virtual Private Cloud (VPC)
- Security Groups
- EC2 Instance for Jenkins
- IAM Configuration
- Networking Components

Terraform configuration is organized into modular files for better maintainability.

---

# 🐳 Containerization

The application is packaged as a Docker image using a custom Dockerfile.

The Docker image contains:

- React production build
- NGINX web server
- Lightweight Alpine Linux base image

Images are versioned and published to Docker Hub.

---

# 🔄 Continuous Integration Pipeline

The CI pipeline is automatically triggered using GitHub Webhooks whenever code is pushed.

Pipeline stages include:

### Workspace Cleanup

Removes previous build artifacts to ensure a clean build environment.

### Source Code Checkout

Fetches the latest application source code from GitHub.

### Environment Validation

Verifies the required tools and dependencies before starting the build.

### Docker Image Build

Builds a new Docker image for the application.

### Security Scan

Performs vulnerability scanning using Trivy.

### Push Docker Image

Publishes the Docker image to Docker Hub with a unique version tag.

---

# 🚀 Continuous Deployment Pipeline

The CD pipeline deploys the application into Kubernetes.

Pipeline stages include:

### Workspace Cleanup

Prepares a clean deployment workspace.

### Deployment Source Checkout

Retrieves Kubernetes and Helm deployment configurations.

### Environment Validation

Verifies Kubernetes cluster connectivity and deployment prerequisites.

### Helm Deployment

Deploys or upgrades the application using Helm.

### Rollout Verification

Verifies that the deployment has successfully completed.

---

# ☸️ Kubernetes Deployment

The application is deployed into Amazon EKS using Kubernetes resources including:

- Deployment
- Service (LoadBalancer)
- ReplicaSet
- Pods
- Horizontal Pod Autoscaler

Application updates are performed using rolling deployments with zero downtime.

---

# 📈 Monitoring

Monitoring is implemented using Prometheus.

Metrics collected include:

- Cluster Health
- Node Metrics
- Pod Metrics
- CPU Utilization
- Memory Utilization

---

# 📊 Grafana Dashboards

Grafana is used for visualizing Kubernetes metrics through dashboards.

Dashboards include:

- Kubernetes Cluster Overview
- Node Metrics
- Pod Metrics
- CPU Usage
- Memory Usage
- Resource Utilization

---

# 📈 Horizontal Pod Autoscaler (HPA)

Horizontal Pod Autoscaler is configured based on CPU utilization.

Configuration:

- Minimum Replicas: 2
- Maximum Replicas: 6
- Target CPU Utilization: 50%

Resource Requests and Limits are configured to enable HPA functionality.

---

# 🔒 Security

Security checks are integrated into the CI pipeline using Trivy.

The pipeline scans Docker images for:

- Critical Vulnerabilities
- High Vulnerabilities
- Operating System Packages
- Application Dependencies

---

# 📸 Project Screenshots

The following screenshots will be added:

- GitHub Repository
- Jenkins CI Pipeline
- Jenkins CD Pipeline
- Docker Hub Repository
- Terraform Infrastructure
- Kubernetes Resources
- Helm Deployment
- Prometheus Targets
- Grafana Dashboard
- Horizontal Pod Autoscaler
- Running Application

---

# 🚧 Future Enhancements

Potential improvements include:

- GitOps deployment using Argo CD
- JFrog Artifactory integration
- Kubernetes Liveness & Readiness Probes
- Network Policies
- RBAC
- Pod Disruption Budget
- SonarQube Integration
- Slack Notifications

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

- Infrastructure as Code (Terraform)
- Docker Image Creation
- CI/CD Pipeline Design
- GitHub Webhook Automation
- Kubernetes Deployments
- Helm Package Management
- Container Security
- Monitoring and Observability
- Kubernetes Autoscaling
- DevOps Troubleshooting
- Production-style Deployment Workflows

---

# 👨‍💻 Author
**Viyas G R**
---
