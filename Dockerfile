# Usar una imagen base ligera
FROM alpine:latest

# Instalar curl para descargar PocketBase y tar para descomprimir
RUN apk add --no-cache curl tar

# Descargar y descomprimir PocketBase desde la URL oficial de GitHub
RUN curl -L https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_0.8.4_linux_amd64.tar.gz -o pocketbase.tar.gz && \
    tar -xvzf pocketbase.tar.gz && \
    rm pocketbase.tar.gz

# Exponer el puerto donde corre PocketBase
EXPOSE 8090

# Iniciar PocketBase
CMD ["./pocketbase", "serve"]
