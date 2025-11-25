# Sistema Multi-Agente de Migração
## Karate Framework para Robot Framework

Sistema modular com 8 agentes independentes para migrar projetos de teste Karate para Robot Framework via chat (VSCode/Copilot).

[English version](README.md)

---

## Visão Geral

Sistema que utiliza agentes especializados executados através de conversação natural no seu IDE. Cada agente pode ser executado independentemente ou como parte de um workflow coordenado.

### Características

- **Design Modular**: Cada agente é independente
- **Execução Flexível**: Execute todos, alguns, ou customize a ordem
- **Interface via Chat**: Controle tudo por conversação
- **Sistema de Checkpoints**: Revise e aprove em pontos chave
- **Recuperação de Erros**: Retome de qualquer ponto
- **Documentação Completa**: Gera toda documentação automaticamente

---

## Os 8 Agentes Independentes

1. **Dependency Mapper** - Mapeia dependências Java para Python
2. **Environment Configuration** - Converte configurações de ambiente
3. **API Endpoint Mapper** - Cataloga endpoints da API
4. **Keyword Library Designer** - Cria bibliotecas de keywords reutilizáveis
5. **Test Strategy** - Define estratégia de testes e tags
6. **Migration** - Converte testes Karate para Robot Framework
7. **Assertion Converter** - Converte assertions
8. **Documentation** - Gera documentação completa

---

## Início Rápido

### 1. Adicione o Projeto ao Contexto
No chat do VSCode, adicione os arquivos do projeto Karate:
```
#Folder examples/Projeto_Karate
```

### 2. Inicie a Migração
```
"Migre meu projeto Karate para Robot Framework"
```

### 3. Escolha o Workflow
O Orchestrator sugere o workflow padrão (8 agentes) e pergunta sua preferência:
- Executar todos os agentes
- Customizar quais executar
- Executar um por vez
- Pular agentes específicos

### 4. Revise nos Checkpoints
O sistema pausa após cada fase para sua revisão e confirmação.

---

## Exemplos de Uso

### Migração Completa
```
"Execute o workflow completo de migração"
```

### Workflow Customizado
```
"Execute apenas os agentes 1, 2, 6 e 8"
ou
"Pule o API Endpoint Mapper e Test Strategy"
```

### Agente Individual
```
"Execute apenas o Migration agent"
```

### Modo Interativo
```
"Execute com checkpoints para eu revisar cada fase"
```

### Retomar Migração
```
"Retome a migração de onde paramos"
```

---

## Documentação

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Arquitetura do sistema (inglês)
- **[AGENTS_OVERVIEW.md](AGENTS_OVERVIEW.md)** - Visão geral dos agentes (inglês)
- **[EXEMPLOS_USO_CHAT.md](EXEMPLOS_USO_CHAT.md)** - Exemplos práticos de uso
- **agents/*/agent-prompt.md** - Instruções de cada agente

---

## Estrutura Gerada

```
Projeto_RobotFramework/
├── config/                 # Configurações de ambiente
├── data/                   # Dados de teste
├── docs/                   # Documentação gerada
├── libraries/              # Bibliotecas Python auxiliares
├── resources/              # Keywords Robot Framework reutilizáveis
├── tests/                  # Arquivos de teste Robot Framework
├── requirements.txt        # Dependências Python
└── README.md              # Documentação do projeto
```

---

## Modos de Execução

### Workflow Completo
Executa todos os 8 agentes na ordem sugerida.

### Workflow Customizado
Execute agentes específicos em qualquer ordem.

### Agente Individual
Execute um agente independentemente.

### Interativo
Execute com checkpoints para revisão após cada fase.

---

## Recuperação de Erros

Se algo der errado:
1. Sistema salva o estado automaticamente
2. Você pode retomar de onde parou
3. Opções: RETRY, SKIP, correção MANUAL, ou ABORT

---

## Exemplo de Conversação

```
Você: "Migre meu projeto Karate. Arquivos: #Folder examples/Projeto_Karate"

Orchestrator: "Analisando projeto...
Encontrado: 65 feature files, 50 Java runners, 3 ambientes

Workflow padrão (8 agentes):
1. Dependency Mapper
2. Environment Configuration
3. API Endpoint Mapper
4. Keyword Library Designer
5. Test Strategy
6. Migration
7. Assertion Converter
8. Documentation

Executar workflow completo? (sim/não/customizar)"

Você: "sim"

Orchestrator: "Iniciando migração...
[Executa Fase 1]
CHECKPOINT 1: Configuração base completa. Revise os arquivos. Continuar? (sim/não)"

Você: "sim"

Orchestrator: [Continua com Fase 2...]
```

---

## Requisitos

- VSCode com Copilot ou interface de chat similar
- Acesso aos arquivos do projeto Karate
- Conhecimento básico de Robot Framework (útil mas não obrigatório)

---

## Licença

[Sua Licença]

---

**Versão**: 2.0  
**Última Atualização**: Novembro 2025
