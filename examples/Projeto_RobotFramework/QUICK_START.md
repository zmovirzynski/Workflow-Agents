# 🚀 Quick Start - Robot Framework

## Instalação Rápida (5 minutos)

### 1. Instalar Python
Certifique-se de ter Python 3.8+ instalado:
```bash
python --version
```

### 2. Instalar Dependências
```bash
pip install -r requirements.txt
```

### 3. Verificar Instalação
```bash
robot --version
```

## Executar Testes (1 minuto)

### Opção 1: Smoke Tests (Mais Rápido)
```bash
robot --include smoke tests/
```
**Tempo**: ~30 segundos  
**Testes**: 2 test cases críticos

### Opção 2: Todos os Testes
```bash
robot tests/
```
**Tempo**: ~2 minutos  
**Testes**: 16 test cases

### Opção 3: Usar Script Automatizado
```bash
# Windows
run_tests.bat

# Linux/Mac
chmod +x run_tests.sh
./run_tests.sh
```

## Ver Resultados

Após a execução, abra o relatório:
```bash
# Windows
start report.html

# Linux
xdg-open report.html

# Mac
open report.html
```

## Comandos Úteis

### Por Tag
```bash
# Apenas testes GET
robot --include get tests/

# Apenas testes de criação
robot --include create tests/

# Testes de regressão
robot --include regression tests/

# Testes negativos
robot --include negative tests/
```

### Por Arquivo
```bash
# Apenas testes GET
robot tests/get_requests.robot

# Apenas testes POST
robot tests/post_requests.robot
```

### Por Teste Específico
```bash
robot --test "Get All Jobs In JSON Format" tests/get_requests.robot
```

### Execução Paralela (Mais Rápido)
```bash
# Instalar pabot
pip install robotframework-pabot

# Executar com 4 processos
pabot --processes 4 tests/
```

### Diferentes Ambientes
```bash
# Staging (padrão)
robot tests/

# Pre-Production
robot --variablefile config/preprod.robot tests/

# Production
robot --variablefile config/prod.robot tests/
```

### Com Mais Detalhes
```bash
# Log detalhado
robot --loglevel DEBUG tests/

# Salvar em diretório específico
robot --outputdir results/minha_execucao tests/
```

## Estrutura Rápida

```
📂 tests/           → Seus testes estão aqui
📂 resources/       → Keywords reutilizáveis
📂 config/          → Configurações de ambiente
📂 docs/            → Documentação completa
📄 report.html      → Relatório visual (gerado após execução)
```

## Próximos Passos

1. ✅ Execute os smoke tests
2. 📖 Leia `docs/SETUP_GUIDE.md` para detalhes
3. 📖 Consulte `docs/KEYWORD_REFERENCE.md` para keywords disponíveis
4. 🔧 Customize `config/*.robot` para seus ambientes
5. ✍️ Adicione novos testes em `tests/`

## Ajuda Rápida

### Problema: "Module not found"
```bash
pip install -r requirements.txt --force-reinstall
```

### Problema: "Connection refused"
- Verifique se a API está rodando em `http://localhost:9898`
- Ajuste `BASE_URL` em `config/staging.robot`

### Problema: Testes falhando
```bash
# Execute com log detalhado
robot --loglevel DEBUG tests/

# Verifique o log.html para detalhes
```

## Documentação Completa

- 📖 [Setup Guide](docs/SETUP_GUIDE.md) - Instalação detalhada
- 📖 [Keyword Reference](docs/KEYWORD_REFERENCE.md) - Todas as keywords
- 📖 [Test Strategy](docs/TEST_STRATEGY.md) - Estratégia de testes
- 📖 [Migration Report](docs/MIGRATION_REPORT.md) - Relatório de migração
- 📖 [API Endpoints](docs/API_ENDPOINTS.md) - Endpoints da API

## Suporte

Dúvidas? Consulte a documentação em `docs/` ou contate a equipe de QA.

---

**Pronto para começar!** Execute `robot --include smoke tests/` agora! 🚀
