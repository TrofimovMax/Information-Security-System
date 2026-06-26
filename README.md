Разработка модуля заявки на обучение в рамках компании предоставляющая информационное обеспечение для групп компаний. Поставляет ПО, занимается администрированием и поддержкой этого ПО.

# Swagger
## Install Redocly CLI

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
