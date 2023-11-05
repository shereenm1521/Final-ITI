# Final-ITI
![image](https://github.com/shereenm1521/Final-ITI-GCP/assets/140805315/bbeeb6f8-057c-4292-911c-43e1ac9c2b6f)

## Overview : 
This project showcases the creation of a comprehensive CI/CD (Continuous Integration/Continuous Deployment) pipeline on Google Cloud Platform (GCP). 
The project evaluates expertise in various domains, including GCP, Networking, Development, Terraform, Docker, Kubernetes, and Jenkins as the CI/CD tool.

In this project, we deploy a simple Python Flask web application (stateless) using two primary Jenkins CI/CD pipelines. 
The first pipeline is responsible for building the project's infrastructure in GCP, and the second pipeline deploys the Python application.

## Prerequisites

1- Before setting up this CI/CD pipeline, ensure you have the following prerequisites in place:

    A GCP account with appropriate permissions.
    Jenkins installed and configured on your server.
    A GitHub repository for the project.
    Terraform, Docker, and Kubernetes tools installed on your Jenkins server.

## Usage

    1- Setting up the Infrastructure:
        Clone this GitHub repository.
        Configure Jenkins to run the first CI/CD pipeline, linked to the GitHub repository.
        Trigger the pipeline to build the GCP infrastructure.

    2- Deploying the Application:
        Once the infrastructure setup is complete, the second CI/CD pipeline will automatically trigger.
        This pipeline will dockerize the web application, push the image to the Artifact Registry, and deploy it to the GKE cluster.

