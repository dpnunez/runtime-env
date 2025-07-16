# Proof of Concept: Boot Time Environment Variables (12factor)

This repository is a **proof of concept** (PoC) demonstrating how to handle environment variables at boot time in Next.js applications. The goal is to allow the **same Docker image** to be used across multiple environments (development, staging, production, etc.), following the [12factor app](https://12factor.net) recommendation to separate configuration from code.

## Purpose

By default, Next.js applications bake environment variables into the build, which requires creating a new Docker image for each environment. With this PoC, configuration can be set when the container starts, making deployments more flexible and secure.

## How it was implemented

1. **External environment files:** The project uses `.env` files and an external file (`external/.env.external`) to store environment variables.
2. **Boot-time override script:** There is a script at `scripts/override-env.sh` that runs when the container starts. This script overrides the container's environment variables with those provided externally, before starting the Next.js server.
3. **Custom Dockerfile:** The `Dockerfile` is set up to copy the override script and ensure it runs as the entrypoint, allowing environment variables to be read at boot, not just at build time.
4. **Multi-environment compatibility:** This way, the same Docker image can be used in different environments, just by providing the appropriate environment file at deploy time.

## How to run with Docker

1. **Build the Docker image:**

   ```bash
   docker build -t nextjs-env-poc .
   ```

2. **Create an `.env` file with the desired variables**  
   (or use `external/.env.external` as an example).

3. **Run the container, mounting the external environment file:**

   ```bash
   docker run --env-file ./external/.env.external -p 3000:3000 nextjs-env-poc
   ```

   - You can replace `./external/.env.external` with the path to your specific environment file.

4. **Access the application:**  
   Open [http://localhost:3000](http://localhost:3000) in your browser.
