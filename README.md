# Blue-Green Deployment Using GitLab CI/CD and IBM Cloud

## Overview
This project demonstrates a **Blue-Green Deployment** strategy using **GitLab CI/CD** and **IBM Cloud**. The deployment strategy minimizes downtime and reduces risks by maintaining two separate environments:
- **Blue**: Current production environment.
- **Green**: New version for testing.

Once the Green environment is tested, traffic is switched seamlessly using **Nginx**. This ensures a smooth update process with an easy rollback option if issues occur.

## Tools Used
- **GitLab CI**: For managing the CI/CD pipeline.
- **IBM Cloud**: Infrastructure and hosting platform.
- **Docker**: For containerization of the application.
- **Kubernetes**: For orchestration and deployment.
- **Helm**: For managing Kubernetes configurations.
- **Terraform**: For Infrastructure as Code (IaC).
- **Nginx**: For load balancing and traffic switching.
- **Prometheus/Grafana**: For monitoring and visualization.

## Project Structure
```
blue_green_deployment/
├── app.py                  # Python application source code
├── requirements.txt        # Python dependencies
├── Dockerfile              # Docker configuration
├── deployment_blue.yaml    # Kubernetes deployment for Blue environment
├── deployment_green.yaml   # Kubernetes deployment for Green environment
├── service.yaml            # Kubernetes service configuration
├── helm_chart/             # Helm chart for managing deployments
│   ├── Chart.yaml
│   ├── values.yaml
├── terraform/              # Terraform scripts for provisioning infrastructure
│   ├── main.tf
│   ├── variables.tf
├── gitlab-ci.yml           # GitLab CI/CD pipeline configuration
├── nginx/                  # Nginx configuration for load balancing
│   ├── nginx.conf
├── monitoring/             # Monitoring configuration
│   ├── prometheus-config.yaml
│   ├── grafana-dashboard.json
└── README.md               # Instructions for execution
```

## Execution Steps

### Step 1: Clone the Repository
```bash
git clone https://github.com/sskarthigadevi/blue_green_deployment.git
cd blue_green_deployment
```

---

### Step 2: Build and Push Docker Images
1. Build and push Docker images for both Blue and Green environments:
   ```bash
   docker build -t karthigaadevi12/app:blue .
   docker push karthigaadevi12/app:blue

   docker build -t karthigaadevi12/app:green .
   docker push karthigaadevi12/app:green
   ```

---

### Step 3: Deploy the Blue Environment
1. Deploy the Blue environment:
   ```bash
   kubectl apply -f deployment_blue.yaml
   ```

2. Verify the Blue environment:
   ```bash
   kubectl rollout status deployment/app-blue
   ```

---

### Step 4: Deploy the Green Environment
1. Deploy the Green environment:
   ```bash
   kubectl apply -f deployment_green.yaml
   ```

2. Verify the Green environment:
   ```bash
   kubectl rollout status deployment/app-green
   ```

---

### Step 5: Switch Traffic with Nginx
1. Update the **Nginx configuration** to route traffic to the Green environment.
2. Apply the updated Nginx configuration:
   ```bash
   kubectl apply -f nginx/nginx.conf
   ```

---

### Step 6: Monitor the Application
1. Deploy Prometheus and Grafana:
   ```bash
   kubectl apply -f monitoring/prometheus-config.yaml
   kubectl apply -f monitoring/grafana-dashboard.json
   ```
2. Access the Grafana dashboard and Prometheus metrics for monitoring.

---

### Step 7: Automate with GitLab CI/CD
1. Edit `gitlab-ci.yml` to configure your GitLab pipeline.
2. Push your code to a GitLab repository to trigger the pipeline:
   ```bash
   git add .
   git commit -m "Add Blue-Green deployment project"
   git push origin main
   ```

---

## Notes
- Ensure you have the necessary tools installed:
  - Docker
  - Kubernetes CLI (`kubectl`)
  - Helm
  - GitLab Runner
- Use IBM Cloud documentation for Kubernetes cluster setup and authentication.

## Acknowledgments
This project is inspired by modern DevOps practices to ensure seamless deployment with minimal downtime.

