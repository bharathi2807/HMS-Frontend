# HMS Frontend – Angular Application

This project is the frontend for the HMS application, developed using Angular 13 and deployed using a CI/CD pipeline with Jenkins and Docker.

---

## Tech Stack
- Angular 13
- Node.js 13
- Docker
- Jenkins
- Git

---

## Project Structure
src/
Dockerfile
Jenkinsfile
angular.json
package.json
README.md

---

## Local Setup (Without Docker)

### Prerequisites
- Node.js 13
- Angular CLI (v13)
- Git

### Steps
git clone https://github.com/bharathi2807/HMS-Frontend.git
cd HMS-Frontend
npm install
ng serve

Application will be available at:
http://localhost:4200

---

## Docker Setup

### Build Docker Image
docker build -t hms-frontend .

### Run Docker Container
docker run -d -p 4200:80 --name hms-frontend-container hms-frontend

---

## CI/CD Pipeline (Jenkins)

This project uses a Jenkins pipeline to automate build and deployment.

### Pipeline Flow
1. Triggered automatically on every Git push
2. Installs Node dependencies
3. Builds Angular production artifacts
4. Builds Docker image
5. Stops the existing container only after successful build
6. Deploys the updated container

---

## DevOps Learning Outcomes
- Implemented CI/CD pipeline using Jenkins
- Dockerized Angular application
- Automated deployments on Git push
- Reduced manual deployment effort
- Ensured consistent deployments across environments

---

## Author
Jeeva Bharathi