# CodeAlpha DevOps Internship Projects

This repository contains my hands-on projects completed as part of the CodeAlpha DevOps Internship.

The projects focus on practical DevOps skills, including cloud infrastructure, containerization, Infrastructure as Code (IaC), build automation, and CI/CD pipelines.

## Projects

### Project 1: Azure CI/CD Pipeline

**Technologies:** Microsoft Azure, Docker, Terraform, Azure Container Registry (ACR), Azure App Service, Azure DevOps.

In this project, I containerized a Node.js application and deployed it to Azure App Service. I used Terraform to provision the infrastructure and Azure DevOps to automate the build and deployment process.

- [View Project 1 documentation](./Project_1_Azure_CICD/README.md)
- [View Project 1 files](./Project_1_Azure_CICD/)

### Project 3: Java Application Using Gradle

**Technologies:** Java 21, Gradle, JUnit 5, GitHub Actions.

In this project, I developed a simple Java application and used Gradle to automate the build process, manage dependencies, run unit tests, and generate an executable JAR file.

I integrated GitHub Actions to automate the build and testing process. The pipeline also uploads the generated JAR as a downloadable artifact after a successful build.

- [View Project 3 documentation](./Project_3_Java_Gradle/README.md)
- [View Project 3 files](./Project_3_Java_Gradle/)
- [View GitHub Actions workflow](./.github/workflows/gradle-ci.yml)

### Project 4: Web Server Using Docker

**Technologies:** Docker, Nginx, HTML5, CSS3.

In this project, I built a static website using HTML and CSS, packaged it into a Docker image using Nginx, and ran it as a container. I also configured a Docker health check and verified that the web server was serving the website correctly.

- [View Project 4 documentation](./Project_4_Docker_Web_Server/README.md)
- [View Project 4 files](./Project_4_Docker_Web_Server/)

## Repository Structure

```text
CodeAlpha_ProjectName/
│
├── .github/
│   └── workflows/
│       └── gradle-ci.yml
│
├── Project_1_Azure_CICD/
│   ├── docs/
│   ├── public/
│   ├── terraform/
│   ├── Dockerfile
│   ├── azure-pipelines.yml
│   ├── server.js
│   └── README.md
│
├── Project_3_Java_Gradle/
│   ├── app/
│   │   ├── src/
│   │   │   ├── main/
│   │   │   └── test/
│   │   └── build.gradle
│   ├── gradle/
│   │   ├── libs.versions.toml
│   │   └── wrapper/
│   ├── gradlew
│   ├── gradlew.bat
│   ├── settings.gradle
│   └── README.md
│
├── Project_4_Docker_Web_Server/
│   ├── docs/
│   ├── index.html
│   ├── styles.css
│   ├── Dockerfile
│   └── README.md
│
└── README.md
```

## About

These projects represent my practical learning and application of DevOps tools and workflows. My focus is on understanding how applications are built, tested, containerized, deployed, and managed using modern DevOps practices.

Through these projects, I have gained hands-on experience with cloud infrastructure, Docker, Terraform, Java build automation, and CI/CD pipelines.
