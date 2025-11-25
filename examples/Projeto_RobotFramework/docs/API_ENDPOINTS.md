# Inventário de Endpoints da API

## Base URL
- **Staging**: `http://localhost:9898`
- **Pre-Prod**: `http://preprod.localhost:9898`
- **Production**: `http://localhost:9898`

## Endpoints Mapeados

### 1. Get All Jobs
- **Endpoint**: `/normal/webapi/all`
- **Método**: GET
- **Headers**: 
  - Accept: application/json | application/xml
- **Status Codes**: 200
- **Resposta**: Array de objetos Job
- **Testes**: `get_requests.robot`

### 2. Create Job Entry
- **Endpoint**: `/normal/webapi/add`
- **Método**: POST
- **Headers**:
  - Accept: application/json | application/xml
  - Content-Type: application/json | application/xml
- **Body**:
```json
{
  "jobId": 5,
  "jobTitle": "Software Engg - 2",
  "jobDescription": "To develop andriod application",
  "experience": ["Google", "Apple", "Mobile Iron"],
  "project": [{
    "projectName": "Movie App",
    "technology": ["Kotlin", "SQL Lite", "Gradle", "Jenkins"]
  }]
}
```
- **Status Codes**: 201
- **Resposta**: Objeto Job criado
- **Testes**: `post_requests.robot`

### 3. Find Job
- **Endpoint**: `/normal/webapi/find`
- **Método**: GET
- **Query Parameters**:
  - id: Job ID
  - jobTitle: Job Title
- **Headers**: 
  - Accept: application/json
- **Status Codes**: 200, 404
- **Resposta**: Objeto Job ou 404 se não encontrado
- **Testes**: `query_parameters.robot`, `delete_requests.robot`

### 4. Update Job Description
- **Endpoint**: `/normal/webapi/update/details`
- **Método**: PATCH
- **Query Parameters**:
  - id: Job ID
  - jobTitle: Job Title
  - jobDescription: Nova descrição
- **Headers**: 
  - Accept: application/json
- **Status Codes**: 200
- **Resposta**: Objeto Job atualizado
- **Testes**: `patch_requests.robot`, `delete_requests.robot`

### 5. Delete Job Entry
- **Endpoint**: `/normal/webapi/remove/{id}`
- **Método**: DELETE
- **Path Parameters**:
  - id: Job ID a ser deletado
- **Headers**: 
  - Accept: application/json
- **Status Codes**: 200, 404
- **Resposta**: Confirmação de deleção ou 404 se não encontrado
- **Testes**: `delete_requests.robot`

## Organização dos Testes

### Por Método HTTP
- **GET**: `get_requests.robot`, `query_parameters.robot`
- **POST**: `post_requests.robot`
- **PATCH**: `patch_requests.robot`
- **DELETE**: `delete_requests.robot`

### Por Funcionalidade
- **CRUD Básico**: Todos os arquivos de teste
- **Validações**: `response_validation.robot`
- **Query Parameters**: `query_parameters.robot`
- **Integração**: `delete_requests.robot` (Request Chaining Demo)

## Padrões de Autenticação
- Atualmente não há autenticação implementada
- Endpoints são públicos no ambiente de teste

## Formatos Suportados
- **Request**: JSON, XML
- **Response**: JSON, XML (baseado no header Accept)
