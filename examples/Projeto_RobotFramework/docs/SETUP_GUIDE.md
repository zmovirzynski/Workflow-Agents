# Guia de Instalação e Configuração

## Pré-requisitos

### Software Necessário
- Python 3.8 ou superior
- pip (gerenciador de pacotes Python)
- Git

### Verificar Instalação
```bash
python --version
pip --version
```

## Instalação

### 1. Clonar o Repositório
```bash
git clone <repository-url>
cd Projeto_RobotFramework
```

### 2. Criar Ambiente Virtual (Recomendado)
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Linux/Mac
python3 -m venv venv
source venv/bin/activate
```

### 3. Instalar Dependências
```bash
pip install -r requirements.txt
```

### 4. Verificar Instalação
```bash
robot --version
```

## Configuração de Ambientes

### Ambientes Disponíveis
- **staging** (padrão)
- **preprod**
- **prod**

### Arquivos de Configuração
- `config/common.robot` - Configurações comuns
- `config/staging.robot` - Ambiente de staging
- `config/preprod.robot` - Ambiente de pré-produção
- `config/prod.robot` - Ambiente de produção

### Selecionar Ambiente
```bash
# Usar staging (padrão)
robot tests/

# Usar preprod
robot --variablefile config/preprod.robot tests/

# Usar prod
robot --variablefile config/prod.robot tests/
```

## Estrutura do Projeto

```
Projeto_RobotFramework/
├── config/                 # Configurações de ambiente
│   ├── common.robot
│   ├── staging.robot
│   ├── preprod.robot
│   └── prod.robot
├── data/                   # Dados de teste
│   └── job_test_data.json
├── docs/                   # Documentação
│   ├── API_ENDPOINTS.md
│   ├── KEYWORD_REFERENCE.md
│   ├── SETUP_GUIDE.md
│   └── TEST_STRATEGY.md
├── libraries/              # Bibliotecas Python customizadas
│   └── APIHelpers.py
├── resources/              # Keywords reutilizáveis
│   ├── common_keywords.robot
│   └── job_keywords.robot
├── results/                # Resultados de execução
├── tests/                  # Testes Robot Framework
│   ├── get_requests.robot
│   ├── post_requests.robot
│   ├── patch_requests.robot
│   ├── delete_requests.robot
│   ├── query_parameters.robot
│   └── response_validation.robot
├── requirements.txt        # Dependências Python
└── README.md
```

## Executando Testes

### Execução Básica
```bash
# Executar todos os testes
robot tests/

# Executar arquivo específico
robot tests/get_requests.robot

# Executar teste específico
robot --test "Get All Jobs In JSON Format" tests/get_requests.robot
```

### Execução por Tags
```bash
# Smoke tests
robot --include smoke tests/

# Regression tests
robot --include regression tests/

# Testes GET
robot --include get tests/

# Testes negativos
robot --include negative tests/
```

### Execução Paralela
```bash
# Instalar pabot
pip install robotframework-pabot

# Executar com 4 processos
pabot --processes 4 tests/

# Executar por arquivo
pabot --testlevelsplit tests/
```

### Opções Úteis
```bash
# Especificar diretório de saída
robot --outputdir results/smoke tests/

# Definir nível de log
robot --loglevel DEBUG tests/

# Executar e continuar em caso de falha
robot --exitonfailure tests/

# Gerar apenas report
robot --output NONE --log NONE --report report.html tests/
```

## Visualizando Resultados

### Arquivos Gerados
- `log.html` - Log detalhado de execução
- `report.html` - Relatório visual resumido
- `output.xml` - Dados estruturados (XML)

### Abrir Relatórios
```bash
# Windows
start report.html

# Linux
xdg-open report.html

# Mac
open report.html
```

## Configuração de IDE

### Visual Studio Code
1. Instalar extensão "Robot Framework Language Server"
2. Configurar settings.json:
```json
{
    "robot.language-server.python": "path/to/venv/bin/python",
    "robot.pythonpath": [
        "libraries",
        "resources"
    ]
}
```

### PyCharm
1. Instalar plugin "Robot Framework Support"
2. Configurar Python Interpreter para o venv
3. Marcar `libraries` e `resources` como Source Roots

## Troubleshooting

### Erro: "Module not found"
```bash
# Reinstalar dependências
pip install -r requirements.txt --force-reinstall
```

### Erro: "Connection refused"
- Verificar se a API está rodando em `http://localhost:9898`
- Verificar configuração de BASE_URL em `config/*.robot`

### Erro: "Permission denied"
```bash
# Linux/Mac - dar permissão de execução
chmod +x venv/bin/activate
```

### Testes Falhando
1. Verificar se a API está acessível
2. Verificar configuração de ambiente
3. Executar com `--loglevel DEBUG` para mais detalhes
4. Verificar logs em `log.html`

## Integração CI/CD

### GitHub Actions
```yaml
name: Robot Framework Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: '3.9'
      - run: pip install -r requirements.txt
      - run: robot --outputdir results tests/
      - uses: actions/upload-artifact@v2
        if: always()
        with:
          name: test-results
          path: results/
```

### GitLab CI
```yaml
robot_tests:
  image: python:3.9
  script:
    - pip install -r requirements.txt
    - robot --outputdir results tests/
  artifacts:
    when: always
    paths:
      - results/
```

### Jenkins
```groovy
pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'robot --outputdir results tests/'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'results/**'
            publishHTML([
                reportDir: 'results',
                reportFiles: 'report.html',
                reportName: 'Robot Framework Report'
            ])
        }
    }
}
```

## Próximos Passos

1. Executar smoke tests: `robot --include smoke tests/`
2. Revisar relatórios gerados
3. Explorar keywords em `resources/`
4. Adicionar novos testes conforme necessário
5. Configurar CI/CD pipeline

## Suporte

Para dúvidas ou problemas:
1. Consultar documentação em `docs/`
2. Verificar logs detalhados em `log.html`
3. Contatar equipe de QA
