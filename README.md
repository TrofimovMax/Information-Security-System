Разработка модуля заявки на обучение в рамках компании предоставляющая информационное обеспечение для групп компаний. Поставляет ПО, занимается администрированием и поддержкой этого ПО.

# Swagger
## Install Redocly CLI

cd ./source/swagger
npm install @redocly/cli@latest

## Build OpenAPI specification

| File / Path              | Purpose |
|-------------------------|--------|
| .api_template           | Template for generating a new api.yaml file |
| .models_template        | Template for generating a new models.yaml file |
| gen.sh                  | Script for creating a new feature scaffold |
| src/*/api.yaml          | Endpoints definition for a specific feature |
| src/*/models.yaml       | Schema definitions for a specific feature |
| src/common/*            | Shared components (schemas, responses, etc.) |
| openapi.yaml            | Root OpenAPI entry file used for bundling |
| dist/swagger.yaml       | Generated bundled Swagger file for viewing |

cd ./source/swagger
npx redocly bundle openapi.yaml -o dist/swagger.yaml

# Structurizr Local

## Prerequisites

Before getting started, install:

- Docker Desktop
- Windows 10/11 with WSL 2 support (recommended)

Make sure Docker Desktop is running.

Verify the installation:

```powershell
docker --version
docker info
```

---

## Project Structure

The project directory must contain the Structurizr workspace file:

```text
Structurizr/
├── workspace.dsl
└── ...
```

---

## Download the Docker Image

On the first run, download the Structurizr Docker image:

```powershell
docker pull structurizr/structurizr
```

---

## Run Structurizr Local

Open PowerShell in the directory containing `workspace.dsl` and run:

```powershell
docker run --rm -p 9000:8080 -v "${PWD}:/usr/local/structurizr" structurizr/structurizr local
```

Once the container is running, open the following URL in your browser:

```text
http://localhost:9000
```

---

## Stop the Server

Press:

```text
Ctrl + C
```

The Docker container will be stopped and automatically removed because of the `--rm` option.

---

## Updating Diagrams

After modifying `workspace.dsl`, refresh the browser page to view the latest changes.
