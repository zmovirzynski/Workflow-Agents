# Multi-Agent Migration System
## Karate Framework to Robot Framework

A modular system with 8 independent agents for migrating Karate test projects to Robot Framework via chat interface (VSCode/Copilot).

---

## Overview

This system uses specialized AI agents that can be executed independently or as part of a coordinated workflow through natural language conversation in your IDE.

### Key Features

- **Modular Design**: Each agent is independent and can run standalone
- **Flexible Execution**: Run all agents, specific ones, or customize the order
- **Chat-Based Interface**: Control everything through natural conversation
- **Checkpoint System**: Review and approve at key phases
- **Error Recovery**: Resume from any point if interrupted
- **Complete Documentation**: Generates all documentation automatically

---

## The 8 Independent Agents

1. **Dependency Mapper** - Maps Java/Maven dependencies to Python equivalents
2. **Environment Configuration** - Converts Karate configs to Robot Framework variables
3. **API Endpoint Mapper** - Catalogs all API endpoints from feature files
4. **Keyword Library Designer** - Creates reusable keyword libraries
5. **Test Strategy** - Defines test organization and tagging strategy
6. **Migration** - Converts Karate tests to Robot Framework
7. **Assertion Converter** - Converts Karate assertions to Robot Framework
8. **Documentation** - Generates complete project documentation

---

## Quick Start

### 1. Add Project to Context
In VSCode chat, add your Karate project files:
```
#Folder examples/Projeto_Karate
```

### 2. Start Migration
```
"Migrate my Karate project to Robot Framework"
```

### 3. Choose Workflow
The Orchestrator will suggest the default workflow (all 8 agents) and ask for your preference:
- Execute all agents
- Customize which agents to run
- Run one agent at a time
- Skip specific agents

### 4. Review at Checkpoints
The system pauses after each phase for your review and confirmation.

---

## Usage Examples

### Complete Migration
```
"Execute the complete migration workflow"
```

### Custom Workflow
```
"Run only agents 1, 2, 6, and 8"
or
"Skip API Endpoint Mapper and Test Strategy"
```

### Single Agent
```
"Execute only the Migration agent"
```

### Interactive Mode
```
"Run with checkpoints so I can review each phase"
```

### Resume Interrupted Migration
```
"Resume the migration from where we stopped"
```

---

## Documentation

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - System architecture and design
- **[AGENTS_OVERVIEW.md](AGENTS_OVERVIEW.md)** - Overview of all agents
- **[EXEMPLOS_USO_CHAT.md](EXEMPLOS_USO_CHAT.md)** - Practical chat examples (Portuguese)
- **[README_PT-BR.md](README_PT-BR.md)** - Complete guide in Portuguese
- **agents/*/agent-prompt.md** - Individual agent instructions

---

## Generated Project Structure

```
Robot_Framework_Project/
├── config/                 # Environment configurations
├── data/                   # Test data
├── docs/                   # Generated documentation
├── libraries/              # Python helper libraries
├── resources/              # Reusable Robot Framework keywords
├── tests/                  # Robot Framework test files
├── requirements.txt        # Python dependencies
└── README.md              # Project documentation
```

---

## Execution Modes

### Full Workflow
Executes all 8 agents in suggested order.

### Custom Workflow
Execute specific agents in any order you choose.

### Single Agent
Execute one agent independently.

### Interactive
Execute with checkpoints for review after each phase.

---

## Error Recovery

If something goes wrong:
1. System automatically saves state
2. You can resume from where you stopped
3. Options: RETRY, SKIP, MANUAL fix, or ABORT

---

## Example Conversation

```
User: "Migrate my Karate project. Files: #Folder examples/Projeto_Karate"

Orchestrator: "Analyzing project...
Found: 65 feature files, 50 Java runners, 3 environments

Default workflow (8 agents):
1. Dependency Mapper
2. Environment Configuration
3. API Endpoint Mapper
4. Keyword Library Designer
5. Test Strategy
6. Migration
7. Assertion Converter
8. Documentation

Execute complete workflow? (yes/no/customize)"

User: "yes"

Orchestrator: "Starting migration...
[Executes Phase 1]
CHECKPOINT 1: Foundation setup complete. Review files. Continue? (yes/no)"

User: "yes"

Orchestrator: [Continues with Phase 2...]
```

---

## Requirements

- VSCode with Copilot or similar AI chat interface
- Access to Karate project files
- Understanding of basic Robot Framework concepts (helpful but not required)

---

## License

[Your License]

---

## Contributing

Contributions are welcome! Please read the architecture documentation before submitting changes.

---

**Version**: 2.0  
**Last Updated**: November 2025
