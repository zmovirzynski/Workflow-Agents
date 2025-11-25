# Agent Usage Guide

## How to Use These Agents with AI

### Step 1: Select Your Agent
Choose the agent based on your current task:
- Need to convert tests? Use **Migration Agent**
- Need code review? Use **Code Review Agent**
- Need performance analysis? Use **Performance Analyzer Agent**

### Step 2: Open the Agent Prompt
Navigate to: `agents/<agent-name>/agent-prompt.md`

### Step 3: Copy the Entire Content
Select all text in the agent-prompt.md file and copy it.

### Step 4: Paste into Your AI Tool
Open your AI assistant (GitHub Copilot, ChatGPT, Claude, etc.) and paste the agent prompt.

### Step 5: Provide Your Input
After the agent prompt, provide your specific input:
- Karate test files
- Robot Framework code to review
- Project structure information
- Configuration requirements

### Step 6: Get Results
The AI will respond as that specialized agent, following its role and responsibilities.

## Example Usage

### Example 1: Converting a Karate Test

**Step 1**: Open `agents/migration/agent-prompt.md`

**Step 2**: Copy all content

**Step 3**: In your AI tool, paste the prompt, then add:
```
Now convert this Karate test:

Feature: User Login
  Scenario: Successful login
    Given url 'https://api.example.com'
    And path '/auth/login'
    And request { username: 'test', password: 'pass123' }
    When method post
    Then status 200
    And match response.token == '#notnull'
```

**Step 4**: Get Robot Framework output

### Example 2: Code Review

**Step 1**: Open `agents/code-review/agent-prompt.md`

**Step 2**: Copy all content

**Step 3**: In your AI tool, paste the prompt, then add:
```
Review this Robot Framework test:

*** Test Cases ***
Login Test
    Create Session    api    http://192.168.1.1
    ${body}=    Create Dictionary    user=admin    pass=admin123
    POST On Session    api    /login    json=${body}
    Status Should Be    200
```

**Step 4**: Get quality review with issues and score

### Example 3: Using Multiple Agents

For complex tasks, use agents in sequence:

1. **API Endpoint Mapper** - Catalog all endpoints
2. **Migration Agent** - Convert tests
3. **Code Review Agent** - Review quality
4. **Security Reviewer** - Check security
5. **Documentation Agent** - Generate docs

## Tips for Best Results

### Be Specific
Provide complete context:
- Full file content when possible
- Project structure information
- Specific requirements or constraints

### Use Sequential Agents
For complex migrations, use agents in logical order:
1. Analysis agents first (Orchestrator, API Mapper)
2. Conversion agents second (Migration, Assertion Converter)
3. Quality agents third (Code Review, Security, Test Analysis)
4. Optimization agents fourth (Performance, Test Strategy)
5. Documentation agents last

### Combine Agent Outputs
Use output from one agent as input to another:
- Migration output -> Code Review input
- API Mapper output -> Migration input
- Test Analysis output -> Performance Analyzer input

### Iterate
Don't expect perfection on first pass:
- Review agent output
- Refine your input
- Run agent again with improvements

## Common Workflows

### Full Migration Workflow
1. Orchestrator Agent - Plan migration
2. Dependency Mapper - Identify dependencies
3. API Endpoint Mapper - Catalog endpoints
4. Migration Agent - Convert files
5. Assertion Converter - Fix assertions
6. Code Review Agent - Review quality
7. Security Reviewer - Check security
8. Test Analysis Agent - Analyze patterns
9. Documentation Agent - Generate docs

### Quick Conversion Workflow
1. Migration Agent - Convert tests
2. Code Review Agent - Quick review
3. Documentation Agent - Basic docs

### Quality Improvement Workflow
1. Code Review Agent - Identify issues
2. Test Analysis Agent - Find patterns
3. Security Reviewer - Security check
4. Performance Analyzer - Optimize
5. Test Strategy Agent - Reorganize

### Setup & Configuration Workflow
1. Dependency Mapper - List dependencies
2. Environment Config Agent - Setup configs
3. Keyword Library Designer - Design libraries
4. Test Strategy Agent - Plan organization

## Troubleshooting

### Agent Not Understanding Context
- Provide more complete input
- Include file structure
- Add specific examples

### Output Not Matching Expectations
- Review agent's role and responsibilities
- Adjust your input to match agent's focus
- Try a different agent for the task

### Need Custom Behavior
- Modify the agent prompt
- Add specific instructions
- Combine multiple agents

## Advanced Usage

### Custom Agent Combinations
Create your own workflows by combining agents in different orders.

### Modified Agent Prompts
Edit agent-prompt.md files to customize behavior for your specific needs.

### Batch Processing
Use the same agent prompt with multiple inputs for consistent results across many files.

### Integration with CI/CD
Use agents to generate CI/CD configurations, test strategies, and reporting setups.
