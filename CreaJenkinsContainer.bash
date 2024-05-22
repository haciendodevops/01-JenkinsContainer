#!/bin/bash

# Nombre del contenedor de Jenkins
JENKINS_CONTAINER_NAME=jenkins

# Ejecutar Jenkins en un contenedor Docker
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --name $JENKINS_CONTAINER_NAME \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

echo "Jenkins está en funcionamiento en el contenedor Docker con acceso a Docker del host."
echo "Accede a Jenkins en: http://localhost:8080"
