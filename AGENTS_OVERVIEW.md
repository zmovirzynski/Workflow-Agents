# Agent System Overview

## 8 Independent Agents for Karate to Robot Framework Migration

### Agent 1: Dependency Mapper
- Maps Java/Maven dependencies to Python equivalents
- Generates requirements.txt
- Documents compatibility notes
- **Independent**: Yes
- **Suggested order**: 1st

### Agent 2: Environment Configuration
- Converts karate-config.js to Robot Framework variables
- Creates config files for each environment
- Handles credentials securely
- **Independent**: Yes
- **Suggested order**: 2nd

### Agent 3: API Endpoint Mapper
- Catalogs all API endpoints from feature files
- Documents HTTP methods and parameters
- Creates endpoint inventory
- **Independent**: Yes
- **Suggested order**: 3rd

### Agent 4: Keyword Library Designer
- Designs reusable keyword libraries
- Creates 3-level keyword hierarchy
- Generates Python helper libraries
- **Independent**: Yes
- **Suggested order**: 4th

### Agent 5: Test Strategy
- Defines test organization strategy
- Creates tagging system
- Plans CI/CD integration
- **Independent**: Yes
- **Suggested order**: 5th

### Agent 6: Migration
- Converts Karate feature files to Robot Framework
- Maps syntax and keywords
- Generates test files
- **Independent**: Yes (works better with keywords)
- **Suggested order**: 6th

### Agent 7: Assertion Converter
- Converts Karate match expressions
- Handles fuzzy matchers
- Updates test files with assertions
- **Independent**: Yes (requires test files)
- **Suggested order**: 7th

### Agent 8: Documentation
- Generates migration summary
- Creates setup guides
- Produces keyword reference
- **Independent**: Yes
- **Suggested order**: 8th

## Execution Patterns

### Full Migration (All 8 Agents)
Execute all agents in suggested order for complete migration:
```bash
python run_migration.py --source <path> --output <path>
```

### Quick Migration (Essential Only)
Execute only essential agents:
```bash
python run_migration.py --agents "1,2,6,8"
```
Agents: Dependency Mapper, Environment Config, Migration, Documentation

### Custom Workflow
Execute specific agents in custom order:
```bash
python run_migration.py --agents "migration,assertion-converter,documentation"
```

### Individual Agent
Execute one agent independently:
```bash
python run_agent.py --agent migration --input <path> --output <path>
```

## Agent Combinations

### Minimal Migration
- Agent 1: Dependency Mapper
- Agent 6: Migration
- Agent 8: Documentation

### Standard Migration
- Agent 1: Dependency Mapper
- Agent 2: Environment Configuration
- Agent 6: Migration
- Agent 7: Assertion Converter
- Agent 8: Documentation

### Complete Migration
- All 8 agents in suggested order

### Architecture Focus
- Agent 3: API Endpoint Mapper
- Agent 4: Keyword Library Designer
- Agent 5: Test Strategy

## Quick Reference

| # | Agent | Input | Output | Independent |
|---|-------|-------|--------|-------------|
| 1 | Dependency Mapper | pom.xml | requirements.txt | Yes |
| 2 | Environment Config | karate-config.js | config/*.robot | Yes |
| 3 | API Endpoint Mapper | .feature files | API_ENDPOINTS.md | Yes |
| 4 | Keyword Designer | .feature files | resources/*.robot | Yes |
| 5 | Test Strategy | Project structure | TEST_STRATEGY.md | Yes |
| 6 | Migration | .feature files | tests/*.robot | Yes |
| 7 | Assertion Converter | tests/*.robot | Updated tests | Yes* |
| 8 | Documentation | All outputs | docs/*.md | Yes |

*Requires test files to exist
