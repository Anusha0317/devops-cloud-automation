Automated Container Deployment and Administration in the Cloud

This project demonstrates a complete end-to-end DevOps automation workflow using Infrastructure as Code (IaC), Configuration Management, Containerization, and CI/CD automation.
The goal of this project is to fully automate cloud infrastructure provisioning, server configuration, container deployment, and continuous delivery of a web application on AWS.
The entire deployment process is automated using Terraform, Ansible, Docker, and GitHub Actions, following modern DevOps practices.

*Project Highlights
Infrastructure provisioning using Terraform
Server configuration using Ansible
Web application containerization using Docker
Automated CI/CD pipeline using GitHub Actions
Deployment on AWS EC2 (Ubuntu)
Fully automated container rebuild and redeployment on every push
                  
Overview

Developer Push → GitHub Repository
                ↓
        GitHub Actions (CI/CD)
                ↓
            Terraform
                ↓
            AWS EC2
                ↓
             Ansible
                ↓
              Docker
                ↓
         Running Web Application
         
*Workflow Explanation

Developer pushes code to GitHub.
GitHub Actions pipeline is triggered.
Terraform provisions AWS EC2 infrastructure.
Ansible connects to EC2 via SSH and configures the server.
Docker image is built automatically.
Docker container is deployed on port 80.
The web application becomes accessible via EC2 Public IP.

Folder Structure

devops-cloud-automation/

├── .github/
│   └── workflows/
│       └── main.yml
│
├── ansible/
│   ├── inventory
│   └── nginx-playbook.yml
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
│
└── .gitignore

Folder Description

terraform/ → Infrastructure provisioning scripts.
ansible/ → Server configuration and Docker deployment.
app/ → Web application source code and Dockerfile.
.github/workflows/ → CI/CD automation pipeline.
.gitignore → Prevents sensitive files from being committed.

*Step-by-Step Execution

1️ Clone Repositor
      git clone <your-repo-url>
      cd devops-cloud-automation

2️ Provision Infrastructure (Terraform)

     cd terraform
     terraform init
    terraform apply
This will:
Create an Ubuntu EC2 instance
Configure security groups (allow SSH and HTTP)
Output the EC2 public IP address

3 Configure Server & Deploy Application (Ansible)

     cd ../ansible
     ansible-playbook -i inventory nginx-playbook.yml

This playbook automatically:
Installs Docker
Starts and enables Docker service
Removes old containers and images (if any)
Builds a new Docker image from /app
Runs the container on port 80
Sets restart policy to always
No manual Docker commands are required.

4️ Verify Deployment

Open your browser:
       http://<EC2_PUBLIC_IP>
If the page loads successfully, it confirms:
EC2 is running
Docker is installed
Container is running
Port 80 is accessible
Application is deployed successfully

*CI/CD Pipeline (GitHub Actions)

The GitHub Actions workflow automates deployment.
On every push to the main branch:
The workflow is triggered
Secure SSH authentication is established using GitHub Secrets
Ansible playbook runs automatically
Docker image is rebuilt
Container is redeployed
Application updates instantly

This ensures continuous deployment with zero manual intervention.


