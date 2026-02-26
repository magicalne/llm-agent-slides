# Claude Code: Tool-Based Agent in Action

## Overview

Claude Code is Anthropic's flagship coding agent - a real-world example of the ARC framework in action:
- **Agentic**: Interacts with file system, terminal, git, web
- **Reasoning**: Plans multi-step solutions, breaks down complex tasks
- **Coding**: Writes, edits, debugs code across languages

## Core Tools

### File Operations

| Tool | Purpose | Example Usage |
|------|---------|---------------|
| **Read** | Read file contents | Understanding existing code before changes |
| **Write** | Create new files | Creating new components, configs |
| **Edit** | Modify existing files | Precise string replacement in code |
| **Glob** | Find files by pattern | `**/*.ts` to find all TypeScript files |
| **Grep** | Search file contents | Find function definitions, usages |

### Execution & Commands

| Tool | Purpose | Example Usage |
|------|---------|---------------|
| **Bash** | Execute shell commands | `npm install`, `git status`, `pytest` |
| **LSP** | Language server features | Go to definition, find references, hover |

### Task Management

| Tool | Purpose | Example Usage |
|------|---------|---------------|
| **TaskCreate** | Create tracked tasks | Break down large features |
| **TaskUpdate** | Update task status | Mark completed, in_progress |
| **TaskList** | View all tasks | See overall progress |
| **TaskGet** | Get task details | Understand requirements |

### Planning & Interaction

| Tool | Purpose | Example Usage |
|------|---------|---------------|
| **AskUserQuestion** | Ask clarifying questions | Choose between approaches |
| **EnterPlanMode** | Plan before implementing | Complex multi-file changes |
| **ExitPlanMode** | Submit plan for approval | Get user sign-off |

### Web & Research

| Tool | Purpose | Example Usage |
|------|---------|---------------|
| **WebSearch** | Search the internet | Find documentation, solutions |
| **mcp__web-reader__webReader** | Read web pages | Fetch documentation content |

### Specialized Agents (via Task)

| Agent | Purpose |
|-------|---------|
| **Explore** | Fast codebase exploration |
| **Plan** | Design implementation plans |
| **Bug-analyzer** | Deep debugging analysis |
| **Code-reviewer** | Code quality review |

## MCP (Model Context Protocol) Tools

Claude Code supports MCP servers for extended capabilities:

### Image Analysis
- `mcp__zai-mcp-server__analyze_image` - General image understanding
- `mcp__zai-mcp-server__analyze_data_visualization` - Charts and graphs
- `mcp__zai-mcp-server__extract_text_from_screenshot` - OCR
- `mcp__zai-mcp-server__diagnose_error_screenshot` - Error analysis
- `mcp__zai-mcp-server__ui_to_artifact` - UI to code conversion

### Web & Content
- `mcp__web-search-prime__webSearchPrime` - Web search
- `mcp__web-reader__webReader` - Read and parse web pages

### GitHub
- `mcp__zread__get_repo_structure` - Get repo structure
- `mcp__zread__read_file` - Read GitHub files
- `mcp__zread__search_doc` - Search repo docs/issues

## The Agent Loop in Claude Code

```
User Request
     ↓
┌─────────────────────────────────────────┐
│  1. PERCEIVE                             │
│     - Read files (Read, Glob, Grep)      │
│     - Understand context (LSP)           │
│     - Check git status (Bash)            │
└─────────────────────────────────────────┘
     ↓
┌─────────────────────────────────────────┐
│  2. REASON                               │
│     - Analyze requirements               │
│     - Plan approach                      │
│     - Decide which tools to use          │
└─────────────────────────────────────────┘
     ↓
┌─────────────────────────────────────────┐
│  3. ACT                                  │
│     - Edit files (Edit, Write)           │
│     - Run commands (Bash)                │
│     - Create commits (Bash + git)        │
└─────────────────────────────────────────┘
     ↓
┌─────────────────────────────────────────┐
│  4. OBSERVE                              │
│     - Check command output               │
│     - Verify file changes                │
│     - Run tests if needed                │
└─────────────────────────────────────────┘
     ↓
  Loop or Return Response
```

## Key Design Principles

### 1. Read Before Edit
Claude Code always reads files before modifying them to understand context.

### 2. Precise Edits
Uses `Edit` tool for surgical changes rather than rewriting entire files.

### 3. Parallel Tool Calls
Executes independent operations in parallel for efficiency:
- Read multiple files at once
- Run unrelated commands together

### 4. Error Handling
- Retries with different approaches
- Asks user for clarification when stuck
- Uses `AskUserQuestion` for critical decisions

### 5. Context Awareness
- Respects `.claude/CLAUDE.md` project instructions
- Maintains session memory
- Uses `--resume` to restore context

## Comparison: Claude Code vs Other Agents

| Feature | Claude Code | Cursor | GitHub Copilot |
|---------|-------------|--------|----------------|
| Terminal access | ✅ Full | ✅ Limited | ❌ |
| Git operations | ✅ Full | ✅ Limited | ❌ |
| Multi-file edits | ✅ | ✅ | ❌ |
| Web search | ✅ | ✅ | ❌ |
| Planning mode | ✅ | ❌ | ❌ |
| Task tracking | ✅ | ❌ | ❌ |
| MCP extensibility | ✅ | ❌ | ❌ |

## Slide Ideas

1. **Tool Categories Overview** - Group tools by type
2. **Agent Loop Diagram** - Show Claude Code's specific flow
3. **Live Demo** - Show tool calls in action
4. **Comparison** - Claude Code vs other coding agents
5. **Best Practices** - How to work effectively with Claude Code

## Demo Script Ideas

```
User: "Add a new API endpoint for user profiles"

Claude Code:
1. [Read] src/api/index.ts - Understand existing API structure
2. [Read] src/types/user.ts - Check user types
3. [Grep] "router.get" - Find routing patterns
4. [Edit] src/api/index.ts - Add new endpoint
5. [Write] src/api/profiles.ts - Create profile handler
6. [Bash] npm test - Verify no regressions
7. [Bash] git diff - Show changes
8. [AskUserQuestion] - "Should I create a commit?"
```

## Sources

- Claude Code official documentation
- System prompt context (this session)
- MCP protocol specification
