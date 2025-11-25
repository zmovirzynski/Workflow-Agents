# System Architecture

## Overview
Multi-agent system for migrating Karate Framework test projects to Robot Framework. Each agent is independent and can be executed individually or as part of a coordinated workflow.

## Design Principles
- **Modularity**: Each agent is self-contained and independent
- **Flexibility**: Agents can be executed in any order or individually
- **Simplicity**: Clear inputs and outputs for each agent
- **Extensibility**: Easy to add new agents or modify existing ones

---

## The 8 Independent Agents

Each agent can run independently. The suggested order is listed, but you can customize the sequence or run individual agents as needed.

### Agent 1: Dependency Mapper
**Purpose**: Maps Java/Maven dependencies to Python/Robot Framework equivalents.

**Input**: pom.xml or build.gradle

**Output**: requirements.txt

**Independent**: Yes

**Suggested order**: 1st

---

### Agent 2: Environment Configuration
**Purpose**: Converts Karate configuration to Robot Framework variable files.

**Input**: karate-config.js

**Output**: config/common.robot, config/staging.robot, config/preprod.robot, config/prod.robot

**Independent**: Yes

**Suggested order**: 2nd

---

### Agent 3: API Endpoint Mapper
**Purpose**: Catalogs all API endpoints from Karate feature files.

**Input**: Karate feature files

**Output**: docs/API_ENDPOINTS.md

**Independent**: Yes

**Suggested order**: 3rd

---

### Agent 4: Keyword Library Designer
**Purpose**: Creates reusable keyword libraries based on test patterns.

**Input**: Karate feature files, API endpoint inventory (optional)

**Output**: resources/common_keywords.robot, resources/specific_keywords.robot, libraries/CustomHelpers.py

**Independent**: Yes

**Suggested order**: 4th

---

### Agent 5: Test Strategy
**Purpose**: Defines test organization, tagging, and execution strategy.

**Input**: Project structure, test patterns

**Output**: docs/TEST_STRATEGY.md

**Independent**: Yes

**Suggested order**: 5th

---

### Agent 6: Migration
**Purpose**: Converts Karate feature files to Robot Framework test files.

**Input**: Karate feature files, keyword libraries (optional)

**Output**: tests/*.robot files

**Independent**: Yes (works better with keywords already created)

**Suggested order**: 6th

---

### Agent 7: Assertion Converter
**Purpose**: Converts Karate match expressions to Robot Framework assertions.

**Input**: Generated Robot Framework test files, original Karate assertions

**Output**: Updated test files with converted assertions

**Independent**: Yes (requires test files to exist)

**Suggested order**: 7th

---

### Agent 8: Documentation
**Purpose**: Generates comprehensive documentation for the migrated project.

**Input**: All generated files, migration statistics

**Output**: docs/MIGRATION_REPORT.md, docs/SETUP_GUIDE.md, docs/KEYWORD_REFERENCE.md, README.md

**Independent**: Yes

**Suggested order**: 8th

---

## How to Use (Via Chat)

### Starting the Migration
In your VSCode chat, provide the Karate project files to context and start with the Orchestrator:

```
User: "I want to migrate my Karate project to Robot Framework. 
Here are my files: #Folder examples/Projeto_Karate"

Orchestrator Agent will:
1. Analyze the project structure
2. Suggest the default workflow (all 8 agents)
3. Ask which agents you want to execute
```

### Default Workflow (Complete Migration)
The Orchestrator suggests this sequence by default:
1. Dependency Mapper
2. Environment Configuration
3. API Endpoint Mapper
4. Keyword Library Designer
5. Test Strategy
6. Migration
7. Assertion Converter
8. Documentation

### Custom Workflow
You can customize which agents to run:

```
User: "Run only agents 1, 2, 6, and 8"
or
User: "Skip the API Endpoint Mapper and Test Strategy agents"
or
User: "I only need Migration and Documentation"
```

### Single Agent Execution
Execute one agent at a time:

```
User: "Run only the Migration agent"
or
User: "Execute Keyword Library Designer agent"
```

### Interactive Mode
Request checkpoints for review:

```
User: "Run the migration with checkpoints so I can review each phase"
```

The Orchestrator will pause after key phases and ask for confirmation before proceeding.

---

## Data Flow

### Simple Flow
```
Karate Project
    |
    v
Agent 1: Dependency Mapper -> requirements.txt
Agent 2: Environment Config -> config/*.robot
Agent 3: API Endpoint Mapper -> docs/API_ENDPOINTS.md
Agent 4: Keyword Designer -> resources/*.robot, libraries/*.py
Agent 5: Test Strategy -> docs/TEST_STRATEGY.md
Agent 6: Migration -> tests/*.robot
Agent 7: Assertion Converter -> tests/*.robot (updated)
Agent 8: Documentation -> docs/*.md, README.md
    |
    v
Robot Framework Project
```

### Agent Dependencies (Optional)
While all agents can run independently, some benefit from outputs of others:

- Agent 4 (Keyword Designer) benefits from Agent 3 (API Mapper) output
- Agent 6 (Migration) works better with Agent 4 (Keywords) output
- Agent 7 (Assertion Converter) requires Agent 6 (Migration) output
- Agent 8 (Documentation) benefits from all previous outputs

---

## Error Handling

### State Persistence
After each agent execution, the Orchestrator updates:
- execution-checklist.md (human-readable progress)
- migration-state.json (machine-readable state)

### Recovery Options
If an agent fails, the Orchestrator will ask:

```
Agent 6 (Migration) failed with error: [error message]

Options:
1. RETRY - Retry this agent
2. SKIP - Skip and continue with next agent
3. MANUAL - I'll fix it manually, then continue
4. ABORT - Stop here, I'll resume later

What would you like to do?
```

### Resume Capability
If you stopped mid-migration:

```
User: "Resume the migration from where we stopped"

Orchestrator will:
1. Load migration-state.json
2. Show what was completed
3. Ask where to continue from
```

---

## Configuration

### Agent Configuration
Each agent has its own prompt file:
- `agents/<agent-name>/agent-prompt.md` - Agent instructions and behavior

### Workflow Customization
You customize the workflow via chat:

```
User: "Use this custom workflow:
1. Dependency Mapper
2. Migration
3. Documentation
Skip everything else"

Orchestrator: "Understood. I'll execute only:
- Agent 1: Dependency Mapper
- Agent 6: Migration  
- Agent 8: Documentation

Proceed? (yes/no)"
```

---

## Extension Points

### Adding New Agents
1. Create directory: `agents/<new-agent>/`
2. Add agent prompt: `agents/<new-agent>/agent-prompt.md`
3. Define input/output in prompt
4. Reference it in Orchestrator's agent list
5. Agent is available for use

### Modifying Agent Order
Tell the Orchestrator via chat:

```
User: "Change the order: run Environment Config first, then Dependency Mapper"

Orchestrator: "Understood. New order:
1. Environment Configuration
2. Dependency Mapper
3. API Endpoint Mapper
... (rest as default)"
```

### Custom Checkpoints
Request checkpoints via chat:

```
User: "Add checkpoints after Dependency Mapper and after Migration"

Orchestrator: "I'll pause for your review:
- After Agent 1 (Dependency Mapper)
- After Agent 6 (Migration)
- After Agent 8 (Documentation) - default"
```

---

## Quality Assurance

### Validation
Each agent validates its output:
- File existence
- Syntax correctness
- Completeness checks

### Reporting
System generates:
- Per-agent execution report
- Overall migration report
- Error log (if any)

---

## Best Practices

### For Full Migration
Run all agents in suggested order for complete migration.

### For Quick Migration
Run essential agents only:
1. Dependency Mapper
2. Migration
3. Documentation

### For Iterative Development
Run agents individually as you develop:
- Test Agent 6 (Migration) multiple times
- Refine Agent 4 (Keywords) as needed
- Update Agent 8 (Documentation) at the end

### For Large Projects
Use interactive mode to review at checkpoints:
```bash
python run_migration.py --mode interactive
```

---

## Troubleshooting

### Agent Fails
Check execution-checklist.md for error details.

### Incomplete Output
Run missing agents individually:
```bash
python run_agent.py --agent <agent-name>
```

### Need to Restart
Use resume capability:
```bash
python run_migration.py --resume
```

---

## Summary

This architecture provides:
- 8 independent, modular agents
- Flexible execution modes
- Error recovery capability
- Easy extensibility
- Clear data flow

Each agent can be used standalone or as part of a coordinated workflow, giving you full control over the migration process.
