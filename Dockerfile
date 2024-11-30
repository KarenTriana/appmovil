# Usar una imagen base ligera
FROM alpine:latest

# Instalar curl para descargar PocketBase
RUN apk add --no-cache curl

# Descargar y descomprimir PocketBase
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.8.2/pocketbase_0.8.2_linux_amd64.tar.gz -o pocketbase.tar.gz && \
    tar -xvzf pocketbase.tar.gz && \
    rm pocketbase.tar.gz

# Exponer el puerto donde corre PocketBase
EXPOSE 8090

# Iniciar PocketBase
CMD ["./pocketbase", "serve"]
