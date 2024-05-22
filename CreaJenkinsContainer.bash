#!/bin/bash

# Nombre del contenedor de Jenkins
JENKINS_CONTAINER_NAME=jenkins

# Ejecutar Jenkins en un contenedor Docker
docker run -d \                      # Ejecuta el contenedor en modo desatendido (detached)
  -p 8080:8080 \                     # Mapea el puerto 8080 del host al puerto 8080 del contenedor (interfaz web de Jenkins)
  -p 50000:50000 \                   # Mapea el puerto 50000 del host al puerto 50000 del contenedor (conexión de agentes Jenkins)
  --name $JENKINS_CONTAINER_NAME \   # Asigna un nombre al contenedor (en este caso, 'jenkins')
  -v jenkins_home:/var/jenkins_home \# Monta un volumen para persistir los datos de Jenkins en el directorio '/var/jenkins_home'
  -v /var/run/docker.sock:/var/run/docker.sock \ # Monta el socket Docker del host en el contenedor para permitir que Jenkins controle Docker
  jenkins/jenkins:lts               # Usa la imagen oficial de Jenkins LTS (Long Term Support)

# Mensaje informativo para el usuario
echo "Jenkins está en funcionamiento en el contenedor Docker con acceso a Docker del host."
echo "Accede a Jenkins en: http://localhost:8080"
