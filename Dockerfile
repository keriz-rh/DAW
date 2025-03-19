# Usar una imagen base con Maven y JDK
FROM maven:3.8.6-openjdk-17 AS build

# Copiar el código fuente al contenedor
WORKDIR /app
COPY . .

# Compilar la aplicación usando el wrapper de Maven y omitir las pruebas
RUN ./mvnw clean package -DskipTests

# Usar una imagen base ligera con JRE
FROM openjdk:17-jdk-slim

# Copiar el archivo JAR generado desde la etapa de compilación
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto en el que corre la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]