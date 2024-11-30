# Usar una imagen base ligera de Alpine Linux
FROM alpine:latest

# Instalar curl y unzip para descargar y descomprimir el archivo .zip
RUN apk add --no-cache curl unzip

# Descargar PocketBase desde GitHub y descomprimir el archivo zip
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.3/pocketbase_0.23.3_linux_amd64.zip -o pocketbase.zip && \
    echo "Verificando la descarga..." && \
    ls -l pocketbase.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip

# Exponer el puerto donde PocketBase corre por defecto
EXPOSE 8090

# Volumen para almacenar los datos de PocketBase de manera persistente
VOLUME ["/data"]

# Iniciar PocketBase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090", "--dir", "/data"]
