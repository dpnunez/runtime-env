#!/bin/sh
BUILD_DIR="./build"
PREFIX="OVERRIDE_"

# Processa argumentos nomeados
while [[ $# -gt 0 ]]; do
  case $1 in
    --buildDir)
      BUILD_DIR="$2"
      shift 2
      ;;
    --prefix)
      PREFIX="$2"
      shift 2
      ;;
    *)
      echo "Argumento desconhecido: $1"
      exit 1
      ;;
  esac
done

echo "Build directory: ${BUILD_DIR}"
echo "Prefix: ${PREFIX}"

for i in $(env | grep -E "^$PREFIX")
do
    key=$(echo $i | cut -d '=' -f 1)
    value=$(echo $i | cut -d '=' -f 2-)
    # contar e substituir todas as ocorrências de "$key" por "$value" em todos os arquivos, ignorando node_modules
    count=$(find "$BUILD_DIR" -type f -exec grep -o "\"$key\"" {} + | wc -l)
    echo "Encontrados ${count} ocorrências de ${key}"
    find "$BUILD_DIR" -type f -exec sed -i "s|\"$key\"|\"$value\"|g" {} +

    echo "Substituídas ${count} ocorrências de ${key}"
done


