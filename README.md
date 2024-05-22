# Configuración de Jenkins para Integración con Docker

Este documento te guiará a través de los pasos necesarios para configurar Jenkins, ejecutar un contenedor Docker, y manejar credenciales sensibles de Docker Hub utilizando Jenkins.

## Configurar Jenkins

Una vez que Jenkins esté en funcionamiento, sigue estos pasos para configurarlo:

### Acceder a Jenkins

1. Ve a [http://localhost:8080](http://localhost:8080) en tu navegador.
2. Completa la configuración inicial de Jenkins (instalar plugins recomendados).

### Instalar los Plugins Necesarios

1. Ve a `Manage Jenkins` > `Manage Plugins`.
2. Instala los plugins `Docker` y `Docker Pipeline`.

### Configurar Credenciales de Docker Hub

1. Ve a `Manage Jenkins` > `Manage Credentials`.
2. Añade las credenciales para Docker Hub que se utilizarán en el `Jenkinsfile`.

## Paso 1: Añadir Credenciales en Jenkins

### Acceder a la Configuración de Jenkins

1. Ve a `Manage Jenkins` > `Manage Credentials`.

### Añadir Nuevas Credenciales

1. Selecciona el dominio apropiado (puede ser el global o uno específico).
2. Haz clic en `Add Credentials`.
3. Selecciona el tipo de credencial que deseas añadir, por ejemplo, "Username with password".

### Ingresar las Credenciales de Docker Hub

- **Kind**: `Username with password`
- **Scope**: `Global` (o selecciona un alcance específico si lo prefieres).
- **Username**: Tu nombre de usuario de Docker Hub.
- **Password**: Tu contraseña de Docker Hub.
- **ID**: Asigna un ID único que usarás para referenciar estas credenciales en el `Jenkinsfile` (por ejemplo, `docker-hub-credentials`).
- **Description**: Opcional, pero útil para identificar las credenciales.

## Paso 2: Referenciar las Credenciales en el Jenkinsfile

Puedes acceder a las credenciales en tu `Jenkinsfile` utilizando bloques de credenciales que las desencriptan y las ponen a disposición de tu pipeline. (ver repo de 'JenkinsPipeline')