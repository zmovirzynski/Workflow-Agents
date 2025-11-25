# Referência de Keywords

## Keywords Comuns (common_keywords.robot)

### Setup e Teardown

#### Setup API Test Suite
```robot
Setup API Test Suite
```
**Descrição**: Configura a sessão API para a suite de testes  
**Uso**: Suite Setup  
**Retorno**: Nenhum

#### Teardown API Test Suite
```robot
Teardown API Test Suite
```
**Descrição**: Limpa a sessão API após a suite  
**Uso**: Suite Teardown  
**Retorno**: Nenhum

#### Setup API Test Case
```robot
Setup API Test Case
```
**Descrição**: Preparação antes de cada caso de teste  
**Uso**: Test Setup  
**Retorno**: Nenhum

#### Teardown API Test Case
```robot
Teardown API Test Case
```
**Descrição**: Limpeza após cada caso de teste  
**Uso**: Test Teardown  
**Retorno**: Nenhum

### Requisições HTTP

#### Send GET Request
```robot
${response}=    Send GET Request    ${endpoint}    ${headers}
```
**Descrição**: Envia requisição GET e retorna a resposta  
**Argumentos**:
- `endpoint` - Endpoint da API (ex: /normal/webapi/all)
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response  
**Exemplo**:
```robot
${headers}=    Create Standard Headers
${response}=    Send GET Request    /normal/webapi/all    ${headers}
```

#### Send POST Request
```robot
${response}=    Send POST Request    ${endpoint}    ${body}    ${headers}
```
**Descrição**: Envia requisição POST com body JSON  
**Argumentos**:
- `endpoint` - Endpoint da API
- `body` - Dicionário com dados do body
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response  
**Exemplo**:
```robot
${job_data}=    Create Standard Job Data    5
${headers}=    Create Standard Headers
${response}=    Send POST Request    /normal/webapi/add    ${job_data}    ${headers}
```

#### Send PUT Request
```robot
${response}=    Send PUT Request    ${endpoint}    ${body}    ${headers}
```
**Descrição**: Envia requisição PUT com body JSON  
**Argumentos**: Similares ao POST  
**Retorno**: Objeto response

#### Send PATCH Request
```robot
${response}=    Send PATCH Request    ${endpoint}    ${params}    ${headers}
```
**Descrição**: Envia requisição PATCH  
**Argumentos**:
- `endpoint` - Endpoint da API
- `params` - Dicionário de parâmetros (opcional)
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response

#### Send DELETE Request
```robot
${response}=    Send DELETE Request    ${endpoint}    ${headers}
```
**Descrição**: Envia requisição DELETE  
**Argumentos**:
- `endpoint` - Endpoint da API
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response

### Validações

#### Verify Status Code
```robot
Verify Status Code    ${response}    200
```
**Descrição**: Verifica o código de status da resposta  
**Argumentos**:
- `response` - Objeto response
- `expected_status` - Código de status esperado

**Exemplo**:
```robot
${response}=    Send GET Request    /normal/webapi/all
Verify Status Code    ${response}    200
```

#### Verify Response Contains
```robot
Verify Response Contains    ${response}    jobTitle    Software Engg - 2
```
**Descrição**: Verifica se a resposta contém um valor específico  
**Argumentos**:
- `response` - Objeto response
- `key` - Chave do JSON
- `expected_value` - Valor esperado

#### Extract JSON Value
```robot
${value}=    Extract JSON Value    ${response}    jobId
```
**Descrição**: Extrai um valor do JSON da resposta  
**Argumentos**:
- `response` - Objeto response
- `json_path` - Caminho no JSON

**Retorno**: Valor extraído

### Utilitários

#### Generate Random Job ID
```robot
${job_id}=    Generate Random Job ID
```
**Descrição**: Gera um ID aleatório para job (1-100)  
**Retorno**: Número inteiro aleatório

#### Create Standard Headers
```robot
${headers}=    Create Standard Headers
${headers}=    Create Standard Headers    accept=${ACCEPT_XML}
```
**Descrição**: Cria headers padrão para requisições  
**Argumentos**:
- `accept` - Valor do header Accept (opcional, padrão: application/json)
- `content_type` - Valor do header Content-Type (opcional, padrão: application/json)

**Retorno**: Dicionário de headers

#### Log Response
```robot
Log Response    ${response}
```
**Descrição**: Loga a resposta completa para debug  
**Argumentos**:
- `response` - Objeto response

## Keywords de Job (job_keywords.robot)

### Operações CRUD

#### Create Job Entry
```robot
${response}=    Create Job Entry    ${job_data}    ${headers}
```
**Descrição**: Cria uma nova entrada de job  
**Argumentos**:
- `job_data` - Dicionário com dados do job
- `headers` - Dicionário de headers

**Retorno**: Objeto response

#### Get All Jobs
```robot
${response}=    Get All Jobs
${response}=    Get All Jobs    ${headers}
```
**Descrição**: Obtém todos os jobs  
**Argumentos**:
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response

#### Find Job By Parameters
```robot
${response}=    Find Job By Parameters    id=5&jobTitle=Software Engg    ${headers}
```
**Descrição**: Busca job por parâmetros de query  
**Argumentos**:
- `params` - String de query parameters
- `headers` - Dicionário de headers (opcional)

**Retorno**: Objeto response

#### Update Job Entry
```robot
${response}=    Update Job Entry    ${job_id}    ${job_data}    ${headers}
```
**Descrição**: Atualiza uma entrada de job completa  
**Argumentos**:
- `job_id` - ID do job
- `job_data` - Dicionário com novos dados
- `headers` - Dicionário de headers

**Retorno**: Objeto response

#### Update Job Description
```robot
${params}=    Create Dictionary    id=5    jobTitle=Software Engg    jobDescription=New description
${response}=    Update Job Description    ${params}    ${headers}
```
**Descrição**: Atualiza apenas a descrição do job  
**Argumentos**:
- `params` - Dicionário de parâmetros
- `headers` - Dicionário de headers

**Retorno**: Objeto response

#### Delete Job Entry
```robot
${response}=    Delete Job Entry    ${job_id}    ${headers}
```
**Descrição**: Remove uma entrada de job  
**Argumentos**:
- `job_id` - ID do job a ser deletado
- `headers` - Dicionário de headers

**Retorno**: Objeto response

### Helpers de Job

#### Create Standard Job Data
```robot
${job_data}=    Create Standard Job Data    5
```
**Descrição**: Cria dados padrão para um job  
**Argumentos**:
- `job_id` - ID do job

**Retorno**: Dicionário com dados do job  
**Estrutura**:
```python
{
    "jobId": 5,
    "jobTitle": "Software Engg - 2",
    "jobDescription": "To develop andriod application",
    "experience": ["Google", "Apple", "Mobile Iron", "Google"],
    "project": [{
        "projectName": "Movie App",
        "technology": ["Kotlin", "SQL Lite", "Gradle", "Jenkins"]
    }]
}
```

#### Verify Job Response
```robot
Verify Job Response    ${response}    Software Engg - 2
```
**Descrição**: Verifica campos básicos da resposta de job  
**Argumentos**:
- `response` - Objeto response
- `expected_title` - Título esperado do job

## Biblioteca Python (APIHelpers.py)

### Métodos Disponíveis

#### Generate Random Number
```robot
${random}=    APIHelpers.Generate Random Number    1    100
```
**Descrição**: Gera um número aleatório entre min e max  
**Argumentos**:
- `min_value` - Valor mínimo (padrão: 1)
- `max_value` - Valor máximo (padrão: 100)

**Retorno**: Número inteiro

#### Generate Random Email
```robot
${email}=    APIHelpers.Generate Random Email
```
**Descrição**: Gera um email aleatório  
**Retorno**: String de email (ex: abcdefghij@test.com)

#### Get Current Timestamp
```robot
${timestamp}=    APIHelpers.Get Current Timestamp
```
**Descrição**: Retorna o timestamp atual  
**Retorno**: String ISO format timestamp

#### Validate JSON Schema
```robot
APIHelpers.Validate JSON Schema    ${json_data}    ${schema}
```
**Descrição**: Valida JSON contra um schema  
**Argumentos**:
- `json_data` - Dados JSON a validar
- `schema` - Schema JSON

**Retorno**: True se válido, exception se inválido

#### Extract Value From JSON
```robot
${value}=    APIHelpers.Extract Value From JSON    ${json_data}    user.name
${value}=    APIHelpers.Extract Value From JSON    ${json_data}    items[0].id
```
**Descrição**: Extrai valor de JSON usando path notation  
**Argumentos**:
- `json_data` - Dados JSON
- `json_path` - Caminho (suporta notação de array)

**Retorno**: Valor extraído

#### Compare JSON Objects
```robot
${equal}=    APIHelpers.Compare JSON Objects    ${actual}    ${expected}    ignore_keys=id,timestamp
```
**Descrição**: Compara dois objetos JSON ignorando chaves específicas  
**Argumentos**:
- `actual` - JSON atual
- `expected` - JSON esperado
- `ignore_keys` - Lista de chaves a ignorar (opcional)

**Retorno**: Boolean

#### Create Query String
```robot
${params}=    Create Dictionary    id=5    jobTitle=Software Engg
${query_string}=    APIHelpers.Create Query String    ${params}
```
**Descrição**: Cria query string a partir de dicionário  
**Argumentos**:
- `params_dict` - Dicionário de parâmetros

**Retorno**: String (ex: id=5&jobTitle=Software Engg)

#### Parse XML To Dict
```robot
${dict}=    APIHelpers.Parse XML To Dict    ${xml_string}
```
**Descrição**: Converte XML string para dicionário  
**Argumentos**:
- `xml_string` - String XML

**Retorno**: Dicionário Python

## Exemplos de Uso Completos

### Exemplo 1: Teste GET Simples
```robot
*** Test Cases ***
Get All Jobs
    Setup API Test Suite
    ${response}=    Get All Jobs
    Verify Status Code    ${response}    200
    Log Response    ${response}
    Teardown API Test Suite
```

### Exemplo 2: Criar e Validar Job
```robot
*** Test Cases ***
Create And Validate Job
    Setup API Test Suite
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${response}    201
    Verify Job Response    ${response}    Software Engg - 2
    ${created_id}=    Extract JSON Value    ${response}    jobId
    Should Be Equal As Integers    ${created_id}    ${job_id}
    Teardown API Test Suite
```

### Exemplo 3: Fluxo Completo CRUD
```robot
*** Test Cases ***
Complete CRUD Flow
    Setup API Test Suite
    
    # Create
    ${job_id}=    Generate Random Job ID
    ${job_data}=    Create Standard Job Data    ${job_id}
    ${headers}=    Create Standard Headers
    ${create_response}=    Create Job Entry    ${job_data}    ${headers}
    Verify Status Code    ${create_response}    201
    
    # Read
    ${params}=    Create Dictionary    id=${job_id}    jobTitle=Software Engg - 2
    ${query_string}=    APIHelpers.Create Query String    ${params}
    ${read_response}=    Find Job By Parameters    ${query_string}    ${headers}
    Verify Status Code    ${read_response}    200
    
    # Update
    ${update_params}=    Create Dictionary
    ...    id=${job_id}
    ...    jobTitle=Software Engg - 2
    ...    jobDescription=Updated description
    ${update_response}=    Update Job Description    ${update_params}    ${headers}
    Verify Status Code    ${update_response}    200
    
    # Delete
    ${delete_response}=    Delete Job Entry    ${job_id}    ${headers}
    Verify Status Code    ${delete_response}    200
    
    Teardown API Test Suite
```

## Convenções de Nomenclatura

### Keywords
- Usar verbos no imperativo: `Create`, `Get`, `Update`, `Delete`, `Verify`
- Ser específico: `Create Job Entry` ao invés de `Create`
- Usar snake_case para arquivos: `common_keywords.robot`

### Variáveis
- Usar ${UPPER_CASE} para constantes: `${BASE_URL}`
- Usar ${lower_case} para variáveis locais: `${job_id}`
- Prefixar com tipo quando útil: `${response}`, `${headers}`

### Tags
- Usar lowercase: `smoke`, `regression`
- Usar hífen para compostas: `query-params`, `data-driven`
- Ser consistente e descritivo
