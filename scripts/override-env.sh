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
    find "$BUILD_DIR" -type d -name node_modules -prune -o -type f -exec sed -i "s|${key}|${value}|g" {} +
done


