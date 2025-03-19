## Kevin Rivera RH16042
```markdown
# Proyecto Docker con Java y PostgreSQL

Este proyecto usa Docker para ejecutar una aplicación Java y una base de datos PostgreSQL.

## Requisitos

- [Docker](https://www.docker.com/get-started)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

## Instalación y ejecución

1. Construir los contenedores:  
   ```bash
   docker-compose build
   ```
2. Iniciar los contenedores:  
   ```
   docker-compose up
   ```
3. Acceder a la aplicación en: [http://localhost:8080](http://localhost:8080) o en [http://localhost:8080/api/test/algo@gmail.com](http://localhost:8080/api/test/algo@gmail.com)  

## Detener los contenedores  

Para detener y eliminar los contenedores, usa:  
```bash
docker-compose down
```

## Descripción rápida

- **`Dockerfile`**:  
  - Construye la aplicación Java con Maven.  
  - Usa OpenJDK 17 para ejecutarla.  
- **`docker-compose.yml`**:  
  - Levanta dos contenedores:  
    - `java_app` (aplicación Java).  
    - `java_db` (PostgreSQL).  
  - Expone los puertos 8080 (app) y 5432 (DB).  

## Notas

- La base de datos usa las credenciales:  
  - Usuario: `postgres`  
  - Contraseña: `postgres`  
  - Base de datos: `postgres`  

¡Listo para usarse! 🚀
```  
