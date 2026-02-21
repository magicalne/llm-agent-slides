# LLM Agent History Timeline

## Key Milestones

### 2022 - ReAct Paper
- **Paper**: "ReAct: Synergizing Reasoning and Acting in Language Models"
- **Authors**: Yao et al. (Princeton + Google Research)
- **Core Idea**: Interleave reasoning (Chain of Thought) with actions
- **Pattern**: Thought → Action → Observation loop

### 2023 June - OpenAI Function Calling (Major Milestone)
- **First native tool calling in LLMs**
- Models: `gpt-3.5-turbo-0613`, `gpt-4-0613`
- **Significance**: LLMs can now call external tools/APIs natively
- **Limitations**:
  - Hallucination in tool parameters
  - Imprecise timing detection for tool calls
  - Not trained specifically for agentic tasks

### 2024 March - Andrew Ng on Agentic AI
- **Event**: Snowflake Summit 2024
- **Key Insight**: Agentic workflows can make smaller models outperform larger ones
- **Evidence**: GPT-3.5 with agentic workflow beats GPT-4 zero-shot on HumanEval
- **Correction**: Andrew Ng emphasized "agentic" as a spectrum, not binary

### 2024 - Anthropic's Focus on Agents
- Claude 3.5 Sonnet released with improved tool calling
- **Key Differentiator**: Post-training/RL specifically for tool use precision
- Better at coding tasks and agentic workflows

### 2025 - Modern Agent Era
- OpenAI releases Operator (January 2025)
- Anthropic releases Claude 4 series
- Claude Code becomes widely adopted
- Programmatic Tool Calling (PTC) introduced

## Why ReAct Failed to Become the Dominant Paradigm

1. **No Real Tool Integration**
   - ReAct was a reasoning framework, not a tool integration system
   - Models weren't trained to actually call tools

2. **Context Pollution**
   - Every tool result goes back into context
   - Token consumption explodes with complex tasks

3. **Model Limitations (2022)**
   - LLMs of that era weren't trained for agentic behavior
   - Required complex prompting to simulate agents

4. **No Feedback Loop**
   - ReAct didn't have a way to learn from mistakes
   - Each interaction started fresh

## The Shift: From ReAct to Tool-Based Agents

| Aspect | ReAct Era (2022) | Modern Era (2024-2025) |
|--------|------------------|------------------------|
| Tool Calling | Prompt-based simulation | Native API support |
| Model Training | General text generation | Fine-tuned for agents |
| Context Management | None | PTC, caching, streaming |
| Error Handling | Manual prompts | Built-in retry/reflection |

## Sources
- ReAct Paper: https://arxiv.org/abs/2210.03629
- OpenAI Function Calling: June 2023 API update
- Andrew Ng Snowflake Summit: March 2024
- Anthropic Tool Use docs
