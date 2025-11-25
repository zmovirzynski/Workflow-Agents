# Projeto Robot Framework - Migrado de Karate

Este projeto foi migrado automaticamente do Karate Framework para Robot Framework utilizando um sistema multi-agente especializado.

## Estrutura do Projeto

```
Projeto_RobotFramework/
├── tests/              # Testes Robot Framework (.robot)
├── resources/          # Arquivos de recursos reutilizáveis
├── libraries/          # Bibliotecas Python customizadas
├── config/             # Configurações de ambiente
├── data/               # Dados de teste
└── results/            # Resultados de execução
```

## Instalação

```bash
pip install -r requirements.txt
```

## Execução

```bash
# Executar todos os testes
robot tests/

# Executar com ambiente específico
robot --variable ENV:staging tests/

# Executar testes específicos por tag
robot --include smoke tests/
robot --include regression tests/
```

## Documentação

- [Guia de Configuração](docs/SETUP_GUIDE.md)
- [Referência de Keywords](docs/KEYWORD_REFERENCE.md)
- [Estratégia de Testes](docs/TEST_STRATEGY.md)
- [Relatório de Migração](docs/MIGRATION_REPORT.md)
