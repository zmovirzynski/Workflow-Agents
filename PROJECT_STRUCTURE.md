# Project Structure

## Root Files

```
.
├── README.md                      # Main documentation (English)
├── README_PT-BR.md               # Main documentation (Portuguese)
├── ARCHITECTURE.md               # System architecture and design
├── AGENTS_OVERVIEW.md            # Overview of all 8 agents
├── EXEMPLOS_USO_CHAT.md          # Practical chat usage examples (Portuguese)
├── .gitignore                    # Git ignore rules
└── PROJECT_STRUCTURE.md          # This file
```

## Agents Directory

```
agents/
├── orchestrator/
│   ├── agent-prompt.md           # Orchestrator instructions
│   ├── execution-checklist.md    # Progress tracking template
│   └── migration-state-template.json  # State persistence template
│
├── dependency-mapper/
│   └── agent-prompt.md           # Agent 1 instructions
│
├── environment-config/
│   └── agent-prompt.md           # Agent 2 instructions
│
├── api-endpoint-mapper/
│   └── agent-prompt.md           # Agent 3 instructions
│
├── keyword-library-designer/
│   └── agent-prompt.md           # Agent 4 instructions
│
├── test-strategy/
│   └── agent-prompt.md           # Agent 5 instructions
│
├── migration/
│   └── agent-prompt.md           # Agent 6 instructions
│
├── assertion-converter/
│   └── agent-prompt.md           # Agent 7 instructions
│
└── documentation/
    └── agent-prompt.md           # Agent 8 instructions
```

## Examples Directory

```
examples/
├── Projeto_Karate/               # Example Karate project (input)
│   ├── src/test/java/
│   │   ├── com/api/automation/   # Feature files and Java runners
│   │   ├── karate-config.js      # Karate configuration
│   │   └── logback-test.xml
│   ├── pom.xml                   # Maven dependencies
│   └── README.md
│
└── Projeto_RobotFramework/       # Example migrated project (output)
    ├── config/                   # Environment configurations
    │   ├── common.robot
    │   ├── staging.robot
    │   ├── preprod.robot
    │   └── prod.robot
    ├── data/                     # Test data
    │   └── job_test_data.json
    ├── docs/                     # Generated documentation
    │   ├── API_ENDPOINTS.md
    │   ├── KEYWORD_REFERENCE.md
    │   ├── MIGRATION_REPORT.md
    │   ├── SETUP_GUIDE.md
    │   └── TEST_STRATEGY.md
    ├── libraries/                # Python helper libraries
    │   └── APIHelpers.py
    ├── resources/                # Reusable keywords
    │   ├── common_keywords.robot
    │   └── job_keywords.robot
    ├── tests/                    # Robot Framework tests
    │   ├── delete_requests.robot
    │   ├── get_requests.robot
    │   ├── patch_requests.robot
    │   ├── post_requests.robot
    │   ├── query_parameters.robot
    │   └── response_validation.robot
    ├── .github/workflows/        # CI/CD examples
    │   └── robot-tests.yml
    ├── requirements.txt          # Python dependencies
    ├── README.md                 # Project documentation
    ├── QUICK_START.md           # Quick start guide
    └── run_tests.sh/bat         # Test execution scripts
```

## Key Files Description

### Root Documentation

- **README.md**: Main project documentation in English
- **README_PT-BR.md**: Complete guide in Portuguese
- **ARCHITECTURE.md**: Technical architecture, agent design, data flow
- **AGENTS_OVERVIEW.md**: Quick reference for all 8 agents
- **EXEMPLOS_USO_CHAT.md**: 10 practical examples of chat-based usage

### Agent Prompts

Each agent has an `agent-prompt.md` file containing:
- Agent role and responsibilities
- Input requirements
- Processing steps
- Output format
- Usage examples

### Orchestrator Files

- **agent-prompt.md**: Main orchestrator logic and workflow
- **execution-checklist.md**: Template for tracking migration progress
- **migration-state-template.json**: Template for state persistence

### Example Projects

- **Projeto_Karate**: Real Karate project used as migration input example
- **Projeto_RobotFramework**: Complete migrated project showing expected output

## Usage Flow

1. User adds Karate project files to chat context
2. User starts conversation with Orchestrator
3. Orchestrator analyzes project and suggests workflow
4. User customizes workflow via chat
5. System executes agents with checkpoints
6. Generated Robot Framework project is ready to use

## File Naming Conventions

- **agent-prompt.md**: Agent instructions (English)
- **README*.md**: Documentation files
- **UPPERCASE.md**: Root-level documentation
- **lowercase.md**: Generated project documentation
- **.robot**: Robot Framework files
- **.py**: Python libraries

## Maintenance

### Adding New Agent

1. Create directory: `agents/<agent-name>/`
2. Add `agent-prompt.md` with agent instructions
3. Update `AGENTS_OVERVIEW.md` with new agent
4. Update Orchestrator's agent list

### Updating Documentation

- **Technical changes**: Update `ARCHITECTURE.md`
- **Agent changes**: Update respective `agent-prompt.md`
- **Usage examples**: Update `EXEMPLOS_USO_CHAT.md`
- **Overview**: Update `AGENTS_OVERVIEW.md`

## Version

**Current Version**: 2.0  
**Last Updated**: November 2025  
**Status**: Production Ready
