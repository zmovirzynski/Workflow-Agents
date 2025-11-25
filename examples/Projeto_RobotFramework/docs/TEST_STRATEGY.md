# Estratégia de Testes - Robot Framework

## Organização dos Testes

### Estrutura de Diretórios
```
tests/
├── get_requests.robot          # Testes de requisições GET
├── post_requests.robot         # Testes de criação (POST)
├── patch_requests.robot        # Testes de atualização parcial (PATCH)
├── delete_requests.robot       # Testes de deleção (DELETE)
├── query_parameters.robot      # Testes com query parameters
└── response_validation.robot   # Testes de validação de resposta
```

### Organização por Tipo de Teste
- **CRUD Básico**: Operações básicas de Create, Read, Update, Delete
- **Validações**: Validação de estrutura JSON, arrays, objetos aninhados
- **Integração**: Testes de encadeamento de requisições
- **Negativos**: Testes de cenários de erro (404, duplicação)

## Estratégia de Tags

### Tags Implementadas

#### Por Método HTTP
- `get` - Requisições GET
- `post` - Requisições POST
- `patch` - Requisições PATCH
- `delete` - Requisições DELETE

#### Por Tipo de Teste
- `smoke` - Testes críticos de smoke
- `regression` - Suite completa de regressão
- `integration` - Testes de integração
- `negative` - Testes de cenários negativos

#### Por Funcionalidade
- `create` - Criação de recursos
- `update` - Atualização de recursos
- `crud` - Operações CRUD
- `validation` - Validações de resposta
- `query-params` - Testes com query parameters
- `json` - Validações JSON
- `xml` - Testes com XML
- `array` - Validações de arrays
- `nested` - Validações de objetos aninhados
- `data-driven` - Testes data-driven

### Execução por Tags

```bash
# Smoke tests (testes críticos)
robot --include smoke tests/

# Regression completa
robot --include regression tests/

# Apenas testes GET
robot --include get tests/

# Testes de criação
robot --include create tests/

# Testes negativos
robot --include negative tests/

# Validações JSON
robot --include json tests/

# Combinação de tags
robot --include smokeANDget tests/
robot --include regressionNOTnegative tests/
```

## Plano de Execução

### 1. Smoke Tests (Execução Rápida - ~2 min)
```bash
robot --include smoke --outputdir results/smoke tests/
```
**Testes incluídos**:
- Get All Jobs In JSON Format
- Create Job Entry In JSON Format

**Quando executar**: A cada commit, antes de merge

### 2. Regression Tests (Execução Completa - ~10 min)
```bash
robot --include regression --outputdir results/regression tests/
```
**Testes incluídos**: Todos os testes marcados como regression

**Quando executar**: Nightly builds, antes de release

### 3. Integration Tests
```bash
robot --include integration --outputdir results/integration tests/
```
**Testes incluídos**: Testes de encadeamento de requisições

**Quando executar**: Após mudanças em múltiplos endpoints

### 4. Negative Tests
```bash
robot --include negative --outputdir results/negative tests/
```
**Testes incluídos**: Cenários de erro e edge cases

**Quando executar**: Semanalmente, antes de release

## Execução Paralela

### Usando Pabot
```bash
# Executar com 4 processos paralelos
pabot --processes 4 --outputdir results tests/

# Executar por arquivo
pabot --testlevelsplit --outputdir results tests/
```

### Grupos de Execução Paralela
- **Grupo 1**: get_requests.robot, query_parameters.robot
- **Grupo 2**: post_requests.robot, response_validation.robot
- **Grupo 3**: patch_requests.robot, delete_requests.robot

## Dependências de Testes

### Testes Independentes
- get_requests.robot (pode executar isoladamente)
- post_requests.robot (cria seus próprios dados)
- query_parameters.robot (cria dados antes de buscar)

### Testes com Dependências
- delete_requests.robot (cria job antes de deletar)
- patch_requests.robot (cria job antes de atualizar)

**Nota**: Todos os testes criam seus próprios dados de teste, garantindo isolamento.

## Estratégia de Dados de Teste

### Geração Dinâmica
- IDs de job são gerados aleatoriamente (1-100)
- Evita conflitos entre execuções paralelas
- Permite re-execução sem cleanup

### Dados Estáticos
- Arquivo `data/job_test_data.json` para testes data-driven
- Templates de job padrão em `job_keywords.robot`

### Cleanup
- Não é necessário cleanup entre testes
- Cada teste cria dados únicos
- Testes de delete fazem seu próprio cleanup

## Integração CI/CD

### Pipeline Sugerido

#### Stage 1: Smoke Tests (2 min)
```yaml
smoke_tests:
  script:
    - robot --include smoke --outputdir results/smoke tests/
  artifacts:
    paths:
      - results/smoke/
```

#### Stage 2: Regression Tests (10 min)
```yaml
regression_tests:
  script:
    - pabot --processes 4 --include regression --outputdir results/regression tests/
  artifacts:
    paths:
      - results/regression/
```

#### Stage 3: Full Suite (15 min)
```yaml
full_suite:
  script:
    - pabot --processes 4 --outputdir results/full tests/
  artifacts:
    paths:
      - results/full/
  only:
    - main
    - release/*
```

### Triggers Recomendados
- **Smoke**: A cada push
- **Regression**: Nightly, antes de merge para main
- **Full Suite**: Antes de release, weekly

### Tratamento de Falhas
- **Smoke falha**: Bloqueia merge
- **Regression falha**: Notifica equipe, não bloqueia
- **Full Suite falha**: Bloqueia release

## Métricas e Reporting

### Métricas a Acompanhar
- Taxa de sucesso por suite
- Tempo de execução por teste
- Cobertura de endpoints
- Tendência de falhas

### Reports Gerados
- `log.html` - Log detalhado de execução
- `report.html` - Relatório visual
- `output.xml` - Dados estruturados para análise

### Dashboards Sugeridos
- Taxa de sucesso por dia
- Tempo de execução por suite
- Top 10 testes mais lentos
- Falhas por categoria

## Manutenção

### Revisão Mensal
- Remover testes duplicados
- Atualizar tags
- Otimizar testes lentos
- Revisar dados de teste

### Boas Práticas
- Manter testes independentes
- Usar tags consistentemente
- Documentar testes complexos
- Manter keywords reutilizáveis atualizadas
