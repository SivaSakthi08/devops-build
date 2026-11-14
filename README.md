# DevOps Application Deployment Project

## 1. Project Overview

This project demonstrates the end-to-end deployment and automation of a React-based web application using DevOps practices.

The application is containerised using Docker and deployed on an AWS EC2 instance. Jenkins is used to automate the Continuous Integration and Continuous Deployment (CI/CD) process through GitHub webhooks.

Docker Hub is used to store application images, while Grafana Cloud and Grafana Alloy are used for server monitoring and metrics collection.

## 2. Technologies Used

| Technology | Purpose |
|---|---|
| Git & GitHub | Source code management and version control |
| Docker | Application containerisation |
| Docker Compose | Container management |
| Docker Hub | Docker image repository |
| Jenkins | CI/CD automation |
| AWS EC2 | Application hosting |
| Linux | Server environment |
| Bash | Build and deployment automation |
| Grafana Cloud | Monitoring dashboard |
| Grafana Alloy | Metrics collection and forwarding |
| Prometheus | Metrics querying and visualisation |

## 3. Project Architecture

The project follows an automated CI/CD workflow.

GitHub → Jenkins → Docker Build → Docker Hub → AWS EC2 → Deployed Application

Monitoring workflow:

AWS EC2 → Grafana Alloy → Grafana Cloud → Prometheus Metrics → Grafana Dashboard

## 4. Project Workflow

### Step 1: Source Code Management

- Cloned the original React application repository.
- Created a personal GitHub repository.
- Configured Git remotes.
- Created separate `dev` and `master` branches for development and production workflows.

### Step 2: Docker Containerisation

- Created a Dockerfile using the Nginx Alpine base image.
- Configured the Dockerfile to copy the production build into the Nginx web directory.
- Exposed port 80 to serve the application.
- Created a Docker Compose file to manage the application container.
- Created `.dockerignore` and `.gitignore` files.

### Step 3: Bash Automation

Created two shell scripts:

**build.sh**
- Automates Docker image creation.
- Builds the application image with the development tag.

**deploy.sh**
- Automates deployment to the AWS EC2 instance.
- Connects to the EC2 server using SSH.
- Pulls the specified Docker image.
- Removes the previous application container.
- Starts the updated container.

### Step 4: Docker Hub Integration

Created two Docker Hub repositories:

- `sivasakthi08/dev` – Public repository for development images.
- `sivasakthi08/prod` – Private repository for production images.

Docker images are pushed to the corresponding repository based on the Git branch.

### Step 5: Jenkins CI/CD Pipeline

Configured Jenkins with GitHub and Docker Hub credentials.

Created a Jenkinsfile to automate the following stages:

1. **Build:** Builds the Docker image based on the branch.
2. **Push:** Authenticates with Docker Hub and pushes the image.
3. **Deploy:** Deploys the production image to AWS EC2 when changes are pushed to the `master` branch.

Configured a GitHub webhook to automatically trigger Jenkins builds whenever code changes are pushed.

### Step 6: AWS EC2 Deployment

- Launched an AWS EC2 instance using Amazon Linux.
- Installed Docker and Jenkins.
- Configured security group rules for application access and SSH.
- Deployed the production Docker container.
- Configured the application to run on port 80.
- Verified the deployed application through a web browser.

### Step 7: Monitoring with Grafana

Configured Grafana Cloud and installed Grafana Alloy on the EC2 instance.

- Configured Alloy to collect server metrics.
- Connected the metrics pipeline to Grafana Cloud.
- Used Prometheus as the metrics data source.
- Created a custom Grafana dashboard to monitor:
  - EC2 server availability
  - CPU metrics
  - Memory usage
  - Disk space
  - Network traffic
  - Server uptime
  - System load

## 5. CI/CD Branch Strategy

| Git Branch | Workflow |
|---|---|
| `dev` | Builds and pushes Docker images to the public development repository |
| `master` | Builds and pushes Docker images to the private production repository and deploys the application |

The GitHub webhook triggers Jenkins automatically when changes are pushed.

## 6. Project Directory Structure

```text
devops-build/
│
├── build/
├── screenshots/
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── build.sh
├── deploy.sh
├── .dockerignore
├── .gitignore
└── README.md
```

## 7. Outcome

Successfully implemented an end-to-end DevOps workflow for a React application.

The project demonstrates:

- Automated application containerisation.
- Git-based development and production workflows.
- Jenkins pipeline automation.
- Docker Hub image management.
- Automated deployment to AWS EC2.
- GitHub webhook integration.
- Server monitoring using Grafana Cloud and Grafana Alloy.

## 8. Conclusion

This project provided practical experience in implementing DevOps concepts, including version control, containerisation, CI/CD automation, cloud deployment and infrastructure monitoring.

It demonstrates how application deployment can be automated and monitored using industry-relevant DevOps tools.
