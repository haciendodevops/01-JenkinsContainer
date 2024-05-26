#!/bin/bash

# Este script realiza las siguientes acciones:
# 1. Define el nombre del contenedor de Jenkins.
# 2. Ejecuta Jenkins en un contenedor Docker en modo desatendido (detached).
# 3. Mapea el puerto 8080 del host al puerto 8080 del contenedor para la interfaz web de Jenkins.
# 4. Mapea el puerto 50000 del host al puerto 50000 del contenedor para la conexión de agentes Jenkins.
# 5. Asigna un nombre al contenedor de Jenkins.
# 6. Monta un volumen para persistir los datos de Jenkins en el directorio '/var/jenkins_home'.
# 7. Monta el socket Docker del host en el contenedor para permitir que Jenkins controle Docker.
# 8. Usa la imagen oficial de Jenkins LTS (Long Term Support).
# 9. Muestra un mensaje informativo para el usuario indicando que Jenkins está en funcionamiento y proporciona la URL para acceder a la interfaz web de Jenkins.

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

# Mensaje informativo para el usuario
echo "Jenkins está en funcionamiento en el contenedor Docker con acceso a Docker del host."
echo "Accede a Jenkins en: http://localhost:8080"
