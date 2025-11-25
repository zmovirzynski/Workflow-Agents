# Exemplos de Uso via Chat

Este documento mostra exemplos práticos de como usar o sistema de migração via chat no VSCode/Copilot.

---

## Exemplo 1: Migração Completa Padrão

```
Usuário: "Quero migrar meu projeto Karate para Robot Framework. 
Arquivos: #Folder examples/Projeto_Karate"

Orchestrator: "Analisando projeto...

Encontrado:
- 65 feature files
- 50 Java runners
- 1 pom.xml com dependências
- 1 karate-config.js com 3 ambientes (staging, preprod, prod)
- 5 endpoints principais identificados

Workflow padrão sugerido:
1. Dependency Mapper - Mapear dependências Java para Python
2. Environment Configuration - Converter configurações
3. API Endpoint Mapper - Catalogar endpoints
4. Keyword Library Designer - Criar keywords reutilizáveis
5. Test Strategy - Definir estratégia de testes
6. Migration - Converter testes
7. Assertion Converter - Converter assertions
8. Documentation - Gerar documentação

Deseja:
A) Executar workflow completo (todos os 8 agentes)
B) Customizar quais agentes executar
C) Executar um agente por vez
D) Pular alguns agentes

Sua escolha?"

Usuário: "A"

Orchestrator: "Perfeito! Iniciando migração completa...

=== FASE 1: Foundation Setup ===

Executando Agent 1: Dependency Mapper...
✓ Analisadas 15 dependências do pom.xml
✓ Mapeadas para equivalentes Python
✓ Gerado requirements.txt com 10 pacotes

Executando Agent 2: Environment Configuration...
✓ Parseado karate-config.js
✓ Identificados 3 ambientes
✓ Gerados 4 arquivos de configuração

CHECKPOINT 1: Foundation Setup Complete

Arquivos gerados:
- requirements.txt (10 pacotes Python)
- config/common.robot
- config/staging.robot
- config/preprod.robot
- config/prod.robot

Por favor, revise estes arquivos.

Continuar para Fase 2 (Architecture Design)?
Responda 'sim' para continuar, 'não' para parar, ou 'modificar' para ajustar."

Usuário: "sim"

Orchestrator: [continua com Fase 2...]
```

---

## Exemplo 2: Migração Customizada

```
Usuário: "Migre meu projeto, mas execute apenas os agentes essenciais"

Orchestrator: "Entendido. Agentes essenciais são:
- Agent 1: Dependency Mapper
- Agent 6: Migration
- Agent 8: Documentation

Isso irá:
✓ Mapear dependências
✓ Converter testes
✓ Gerar documentação básica

Mas NÃO irá:
✗ Criar keywords reutilizáveis
✗ Definir estratégia de testes
✗ Catalogar endpoints

Prosseguir com apenas estes 3 agentes?"

Usuário: "Sim, mas adicione o Keyword Library Designer também"

Orchestrator: "Perfeito! Workflow ajustado:
1. Dependency Mapper
2. Keyword Library Designer
3. Migration
4. Documentation

Iniciando..."
```

---

## Exemplo 3: Executar Agente Individual

```
Usuário: "Execute apenas o Migration agent"

Orchestrator: "Vou executar apenas o Migration agent.

Nota: Este agente funciona melhor se você já tiver:
- Keywords criadas (Agent 4: Keyword Library Designer)
- Configurações de ambiente (Agent 2: Environment Configuration)

Você tem estes arquivos? Se não, posso executar esses agentes primeiro."

Usuário: "Não tenho. Execute o que for necessário primeiro"

Orchestrator: "Entendido. Vou executar na ordem:
1. Environment Configuration (necessário para variáveis)
2. Keyword Library Designer (necessário para keywords)
3. Migration (seu objetivo)

Prosseguir?"

Usuário: "Sim"
```

---

## Exemplo 4: Ordem Customizada

```
Usuário: "Execute os agentes nesta ordem: 
Environment Config, Dependency Mapper, Migration, Documentation"

Orchestrator: "Ordem customizada aceita:
1. Agent 2: Environment Configuration
2. Agent 1: Dependency Mapper
3. Agent 6: Migration
4. Agent 8: Documentation

Nota: Esta ordem é diferente da sugerida, mas funciona.

Iniciando com Agent 2..."
```

---

## Exemplo 5: Pular Agentes Específicos

```
Usuário: "Execute o workflow completo, mas pule o API Endpoint Mapper 
e o Test Strategy"

Orchestrator: "Workflow ajustado (pulando agents 3 e 5):
1. Dependency Mapper ✓
2. Environment Configuration ✓
3. API Endpoint Mapper ✗ (pulado)
4. Keyword Library Designer ✓
5. Test Strategy ✗ (pulado)
6. Migration ✓
7. Assertion Converter ✓
8. Documentation ✓

Executarei 6 de 8 agentes. Prosseguir?"

Usuário: "Sim"
```

---

## Exemplo 6: Modo Interativo com Checkpoints

```
Usuário: "Execute a migração completa, mas pause após cada fase 
para eu revisar"

Orchestrator: "Modo interativo ativado. Pausarei após:
- Fase 1 (Foundation Setup)
- Fase 2 (Architecture Design)
- Fase 3 (Test Migration)
- Fase 4 (Documentation)

Iniciando Fase 1...

[executa agents 1 e 2]

CHECKPOINT 1: Fase 1 completa

Arquivos gerados:
- requirements.txt
- config/*.robot (4 arquivos)

Revise estes arquivos. Quando estiver pronto, responda:
- 'continuar' para Fase 2
- 'modificar X' se quiser ajustar algo
- 'parar' para interromper aqui"

Usuário: "continuar"

Orchestrator: "Iniciando Fase 2..."
```

---

## Exemplo 7: Retomar Migração Interrompida

```
Usuário: "Retome a migração de onde paramos"

Orchestrator: "Carregando estado anterior...

Última sessão:
- Iniciada: 25/11/2025 10:00
- Última atualização: 25/11/2025 10:15
- Status: Interrompida na Fase 2

Progresso:
✓ Fase 1: Foundation Setup - COMPLETO
⏸ Fase 2: Architecture Design - EM PROGRESSO
  ✓ Agent 3: API Endpoint Mapper - COMPLETO
  ✗ Agent 4: Keyword Library Designer - PENDENTE
  ✗ Agent 5: Test Strategy - PENDENTE
⏸ Fase 3: Test Migration - PENDENTE
⏸ Fase 4: Documentation - PENDENTE

Arquivos já gerados:
- requirements.txt
- config/*.robot (4 arquivos)
- docs/API_ENDPOINTS.md

Deseja:
A) Continuar de onde parou (Agent 4)
B) Refazer a Fase 2 completa
C) Pular para Fase 3
D) Começar do zero

Sua escolha?"

Usuário: "A"

Orchestrator: "Retomando do Agent 4: Keyword Library Designer..."
```

---

## Exemplo 8: Lidar com Erro

```
Orchestrator: "Executando Agent 6: Migration...

Processando feature files:
✓ getRequest.feature -> tests/get_requests.robot
✓ createJobEntry.feature -> tests/post_requests.robot
✗ complexScenario.feature -> ERRO

Erro: Não foi possível parsear o arquivo complexScenario.feature
Linha 45: Sintaxe Karate inválida

Progresso: 5 de 6 arquivos convertidos

Opções:
1. RETRY - Tentar novamente
2. SKIP - Pular este arquivo e continuar
3. MANUAL - Vou corrigir manualmente, depois continue
4. ABORT - Parar aqui, retomo depois

O que deseja fazer?"

Usuário: "3 - vou corrigir"

Orchestrator: "Entendido. Estado salvo.

Quando corrigir o arquivo complexScenario.feature, me avise:
'Arquivo corrigido, continue a migração'

Aguardando..."

[usuário corrige o arquivo]

Usuário: "Arquivo corrigido, continue a migração"

Orchestrator: "Retomando Agent 6: Migration...

Processando arquivo corrigido:
✓ complexScenario.feature -> tests/response_validation.robot

Agent 6 completo! Todos os 6 arquivos convertidos.

Continuando para Agent 7: Assertion Converter..."
```

---

## Exemplo 9: Modificar Durante Checkpoint

```
Orchestrator: "CHECKPOINT 1: Foundation Setup Complete

Arquivos gerados:
- requirements.txt
- config/common.robot
- config/staging.robot

Continuar para Fase 2?"

Usuário: "Espera, preciso adicionar uma dependência extra no requirements.txt"

Orchestrator: "Sem problema! Faça as modificações necessárias.

Quando terminar, me avise:
- 'pronto, continue' para prosseguir
- 'refazer agent 1' se quiser que eu regenere o arquivo

Aguardando..."

Usuário: "pronto, continue"

Orchestrator: "Ótimo! Continuando para Fase 2..."
```

---

## Exemplo 10: Ajuda Durante Migração

```
Usuário: "Não entendi o que o Keyword Library Designer faz"

Orchestrator: "O Keyword Library Designer (Agent 4) analisa seus testes 
Karate e cria keywords reutilizáveis no Robot Framework.

Por exemplo, se você tem este padrão repetido em vários testes:
```
Given url 'http://localhost:9898'
And path '/normal/webapi/all'
When method get
Then status 200
```

O agente cria uma keyword:
```
Get All Jobs
    ${response}=    GET On Session    api    /normal/webapi/all
    Verify Status Code    ${response}    200
```

Isso torna seus testes mais legíveis e fáceis de manter.

Deseja que eu execute este agente agora?"

Usuário: "Sim, execute"
```

---

## Comandos Úteis

### Verificar Progresso
```
Usuário: "Qual o status da migração?"
Usuário: "Mostre o que já foi feito"
Usuário: "Onde estamos?"
```

### Modificar Workflow
```
Usuário: "Adicione o agent X ao workflow"
Usuário: "Remova o agent Y"
Usuário: "Mude a ordem: execute Z antes de W"
```

### Controle de Execução
```
Usuário: "Pause aqui"
Usuário: "Continue"
Usuário: "Pule este agente"
Usuário: "Volte para o checkpoint anterior"
```

### Ajuda
```
Usuário: "Explique o que este agente faz"
Usuário: "Quais arquivos serão gerados?"
Usuário: "Como funciona o checkpoint?"
Usuário: "Mostre exemplos de uso"
```

---

Estes exemplos mostram a flexibilidade do sistema via chat. Você tem controle total sobre o processo de migração através de conversação natural.
