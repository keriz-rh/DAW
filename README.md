
```markdown
# Proyecto Docker con Java y PostgreSQL
Kevin Rivera RH16042

Este proyecto utiliza Docker para crear contenedores para una aplicación Java y una base de datos PostgreSQL. El archivo `Dockerfile` construye la aplicación Java y el archivo `docker-compose.yml` se encarga de orquestar los contenedores para la aplicación y la base de datos.

## Requisitos

Para ejecutar este proyecto, necesitas tener instalado Docker y Docker Compose en tu máquina local.

- Docker: [Descargar Docker](https://www.docker.com/get-started)
- Docker Compose: [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Estructura del Proyecto

```
.
├── Dockerfile
├── docker-compose.yml
├── mvnw
├── mvnw.cmd
├── pom.xml
└── src
```

- **Dockerfile**: Define el proceso de construcción y ejecución de la aplicación Java.
- **docker-compose.yml**: Orquesta los contenedores para la aplicación y la base de datos.
- **mvnw**: Script del Maven Wrapper para construir el proyecto sin necesidad de tener Maven instalado globalmente.
- **pom.xml**: El archivo de configuración de Maven.
- **src**: El código fuente de la aplicación Java.

## Construcción y Ejecución

### 1. Construir los contenedores

Desde el directorio raíz del proyecto, ejecuta el siguiente comando para construir la imagen del proyecto:

```bash
docker-compose build
```

Este comando construirá la imagen del contenedor `java_app` utilizando el `Dockerfile` y también descargará la imagen oficial de PostgreSQL para el contenedor `java_db`.

### 2. Iniciar los contenedores

Una vez que la construcción se haya completado, puedes iniciar ambos contenedores con:

```bash
docker-compose up
```

Esto iniciará dos contenedores:
- **java_app**: El contenedor que ejecuta la aplicación Java.
- **java_db**: El contenedor que ejecuta la base de datos PostgreSQL.

### 3. Acceso a la aplicación

La aplicación estará disponible en [http://localhost:8080](http://localhost:8080) en tu navegador.

### 4. Detener los contenedores

Para detener los contenedores, puedes presionar `Ctrl + C` o ejecutar:

```bash
docker-compose down
```

## Explicación del Dockerfile

El `Dockerfile` está dividido en dos fases:

### Fase 1: Construcción de la aplicación

- Se utiliza la imagen `openjdk:17-jdk-slim` para construir la aplicación Java.
- Se instala Maven y se copian los archivos del proyecto.
- Se ejecuta el comando `mvnw clean package -DskipTests` para construir el proyecto sin ejecutar los tests.

### Fase 2: Ejecución de la aplicación

- Se utiliza una imagen `openjdk:17-jdk-alpine` para ejecutar la aplicación Java.
- Se copia el archivo `.jar` generado en la fase anterior al contenedor.
- Se expone el puerto 8080 y se inicia la aplicación con `java -jar app.jar`.

## Explicación del Docker Compose

El archivo `docker-compose.yml` define dos servicios:

### Servicio `java_app`

- **image**: Se construye una imagen personalizada llamada `corto1:1.0`.
- **build**: Construye la imagen usando el `Dockerfile` en el directorio actual.
- **ports**: Expone el puerto 8080 del contenedor en el puerto 8080 de tu máquina local.
- **depends_on**: Asegura que el contenedor `java_db` se inicie antes de `java_app`.

### Servicio `java_db`

- **image**: Utiliza la imagen oficial de PostgreSQL.
- **ports**: Expone el puerto 5432 del contenedor para que puedas conectarte a la base de datos desde tu máquina local.
- **environment**: Configura el usuario, la contraseña y la base de datos de PostgreSQL.

## Notas

- Asegúrate de que la aplicación Java esté configurada correctamente para conectarse a la base de datos PostgreSQL. Los valores de las variables de entorno (`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`) deben coincidir con los valores en la configuración de la aplicación.
- Si la aplicación tarda un poco en arrancar debido a la base de datos, considera usar un script de espera para verificar que la base de datos esté lista antes de iniciar la aplicación (por ejemplo, usando `wait-for-it`).


```
