# How Tool-Based Agent Works: The Agent Loop

## Core Concept

The Agent Loop is the fundamental execution pattern for modern LLM agents.

## Basic Agent Loop

```
┌─────────────────────────────────────────────┐
│              AGENT LOOP                      │
│                                              │
│  1. PERCEIVE                                 │
│     ↓                                        │
│  [User Input / Environment / Tool Results]  │
│                                              │
│  2. REASON                                   │
│     ↓                                        │
│  [LLM decides what to do next]              │
│                                              │
│  3. ACT                                      │
│     ↓                                        │
│  [Call tool / Respond to user]              │
│                                              │
│  4. OBSERVE                                  │
│     ↓                                        │
│  [Process tool output]                       │
│     ↓                                        │
│  ┌── Loop back to PERCEIVE ──┐              │
└─────────────────────────────────────────────┘
```

## Detailed Breakdown

### 1. Perceive
- Receive user message
- Process tool results from previous iteration
- Gather context from memory/environment

### 2. Reason (LLM Decision)
- Analyze current state
- Decide: use tool OR respond to user
- Generate tool call parameters OR final response

### 3. Act
- **If tool needed**: Execute tool with parameters
- **If done**: Return response to user

### 4. Observe
- Capture tool execution result
- Handle errors if any
- Feed back to next iteration

## Pseudocode Implementation

```python
def agent_loop(user_input, tools, max_iterations=10):
    messages = [{"role": "user", "content": user_input}]

    for i in range(max_iterations):
        # 1. PERCEIVE + 2. REASON
        response = llm.generate(
            messages=messages,
            tools=tools  # Available tools
        )

        # Check if done
        if response.stop_reason == "end_turn":
            return response.content  # Final answer

        # 3. ACT - Tool call needed
        if response.stop_reason == "tool_use":
            tool_name = response.tool_call.name
            tool_params = response.tool_call.input

            # Execute the tool
            tool_result = execute_tool(tool_name, tool_params)

            # 4. OBSERVE - Add result to context
            messages.append({
                "role": "user",
                "content": [{
                    "type": "tool_result",
                    "tool_use_id": response.tool_call.id,
                    "content": tool_result
                }]
            })

    return "Max iterations reached"
```

## Key Components

| Component | Purpose | Example |
|-----------|---------|---------|
| System Prompt | Define agent behavior, capabilities | "You are a helpful assistant with access to weather API..." |
| Tools Definition | Describe available tools | `{name: "get_weather", params: {location: string}}` |
| Context Window | Store conversation + tool results | Message history |
| LLM | Decision engine | Claude, GPT-4 |
| Tool Executor | Actually run the tools | API calls, database queries |

## Modern Optimizations

### 1. Programmatic Tool Calling (PTC)
- Instead of returning each tool result to LLM
- Let LLM write code that chains multiple tools
- Only final result goes back to LLM
- **Benefit**: Drastically reduced token usage

### 2. Tool Selection/Search
- When you have 100s of tools
- Don't load all into context
- Use search/embedding to find relevant tools

### 3. Parallel Tool Calling
- Execute independent tools simultaneously
- Reduce latency

### 4. Reflection/Self-Correction
- Agent can review its own tool calls
- Retry with different parameters on failure

## Examples of Tool-Based Agents

| Agent | Description | Key Features |
|-------|-------------|--------------|
| Claude Code | Coding assistant | File system tools, terminal access |
| OpenAI Operator | Web browser agent | Browser automation tools |

## Common Patterns

### Single-Step
```
User → LLM → Tool → LLM → Response
```

### Multi-Step (Chain)
```
User → LLM → Tool1 → LLM → Tool2 → LLM → Tool3 → LLM → Response
```

### Parallel
```
                → Tool A →
User → LLM     → Tool B → LLM → Response
                → Tool C →
```

### Recursive/Tree
```
User → LLM → [Sub-agent 1] →
                 ↓
              [Sub-agent 2] → LLM → Response
```
