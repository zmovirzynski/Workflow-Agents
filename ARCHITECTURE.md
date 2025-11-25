# System Architecture

## Overview
This is a multi-agent AI system designed for QA teams to migrate Java Karate test projects to Robot Framework. The system uses specialized agents coordinated by an orchestrator to ensure high-quality test migration.

## Agent Architecture

### 1. Orchestrator Agent
**Location**: `agents/orchestrator/orchestrator_agent.py`

**Purpose**: Central coordinator that manages the entire migration workflow.

**How it works**:
- Receives migration request with source and destination paths
- Analyzes the Karate project structure (feature files, step definitions, configs)
- Executes agents in sequence: Migration -> Code Review -> Test Analysis -> Documentation
- Aggregates results from all agents
- Generates final migration report

**Key methods**:
- `analyze_project()`: Scans Karate project and categorizes files
- `execute_workflow()`: Runs all agents in proper sequence
- `generate_report()`: Creates comprehensive migration report

### 2. Migration Agent
**Location**: `agents/migration/migration_agent.py`

**Purpose**: Converts Karate tests to Robot Framework format.

**How it works**:
- Parses Karate feature files using regex patterns
- Maps Karate syntax to Robot Framework equivalents:
  - Feature -> Test Suite
  - Scenario -> Test Case
  - Given/When/Then -> Keywords
  - Java step definitions -> Python keyword libraries
- Creates proper Robot Framework file structure (tests/, libraries/, resources/)
- Generates reusable keyword libraries and resource files

**Conversion mappings**:
- `url` -> `Create Session`
- `path` -> `Set Test Variable`
- `method get` -> `GET On Session`
- `method post` -> `POST On Session`
- `status` -> `Status Should Be`
- `match` -> `Response Should Match`

### 3. Code Review Agent
**Location**: `agents/code_review/code_review_agent.py`

**Purpose**: QA-focused code quality review of converted tests.

**How it works**:
- Scans all generated Robot Framework files
- Checks against best practices:
  - Documentation completeness
  - Naming conventions (descriptive test names)
  - No hardcoded values (IPs, URLs)
  - Proper keyword length and complexity
  - Resource file usage
- Assigns severity levels: High (issues), Medium (warnings), Low (suggestions)
- Calculates quality score (0-100)

**Review criteria**:
- Missing documentation: -10 points
- Poor naming: -5 points
- Hardcoded values: -5 points
- Complex keywords: -3 points
- Missing resources: -2 points

### 4. Test Analysis Agent
**Location**: `agents/test_analysis/test_analysis_agent.py`

**Purpose**: Analyzes test patterns, coverage, and quality metrics.

**How it works**:
- Counts total test cases and keywords
- Detects duplicate test scenarios
- Analyzes keyword usage patterns (most used, reusability)
- Calculates complexity metrics:
  - Total lines of code
  - Average lines per file
  - Complexity score (Low/Medium/High)
- Generates actionable recommendations

**Metrics tracked**:
- Test count and keyword count
- Duplicate detection
- Keyword reuse statistics
- File complexity
- Coverage gaps

### 5. Documentation Agent
**Location**: `agents/documentation/documentation_agent.py`

**Purpose**: Generates comprehensive documentation for migrated project.

**How it works**:
- Creates migration summary with statistics
- Generates test suite documentation
- Produces setup and installation guide
- Creates keyword reference documentation
- Formats all documentation in Markdown

**Generated documents**:
- `MIGRATION_SUMMARY.md`: Overview of migration results
- `TEST_DOCUMENTATION.md`: How to run and organize tests
- `SETUP_GUIDE.md`: Installation and configuration
- `KEYWORD_REFERENCE.md`: Complete keyword documentation

## Workflow Sequence

```
1. User runs: python run_migration.py <karate_path> <output_path>
2. Orchestrator analyzes Karate project structure
3. Migration Agent converts files to Robot Framework
4. Code Review Agent checks quality and best practices
5. Test Analysis Agent analyzes patterns and metrics
6. Documentation Agent generates all documentation
7. Orchestrator creates final report (migration_report.json)
```

## Data Flow

```
Karate Project
    |
    v
Orchestrator (analyze)
    |
    v
Migration Agent (convert)
    |
    v
Robot Framework Files
    |
    v
Code Review Agent (review)
    |
    v
Test Analysis Agent (analyze)
    |
    v
Documentation Agent (document)
    |
    v
Final Report + Documentation
```

## Configuration

All agents are configured via `config/agent_config.yaml`:
- Agent roles and responsibilities
- Workflow steps and sequence
- Review criteria and thresholds
- Output formats

## Extension Points

To add new agents:
1. Create new agent class in `agents/<agent_name>/`
2. Implement required methods
3. Add to workflow in `agent_config.yaml`
4. Update orchestrator to call new agent

## Quality Assurance Focus

This system is built specifically for QA teams:
- Maintains test integrity during migration
- Enforces Robot Framework best practices
- Provides detailed quality metrics
- Generates comprehensive documentation
- Identifies improvement opportunities
