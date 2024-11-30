# Usar una imagen base ligera de Alpine Linux
FROM alpine:latest

# Instalar curl para descargar PocketBase y tar para descomprimir
RUN apk add --no-cache curl tar

# Descargar PocketBase desde GitHub (reemplaza con la URL correcta de la versión deseada)
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.8.4/pocketbase_0.8.4_linux_amd64.tar.gz -o pocketbase.tar.gz && \
    ls -l pocketbase.tar.gz && \
    tar -xvzf pocketbase.tar.gz && \
    rm pocketbase.tar.gz

# Exponer el puerto donde PocketBase corre por defecto
EXPOSE 8090

# Iniciar PocketBase
CMD ["./pocketbase", "serve"]
