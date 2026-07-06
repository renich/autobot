## 2024-05-19 - Crystal CLI Output Buffering
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer to the screen, causing prompts (like "You: ") or loading states (like "Thinking...") to be delayed until a newline or input is encountered.
**Action:** Always append `STDOUT.flush` immediately after `print` statements when prompting the user or displaying non-newline status indicators to ensure immediate visual feedback.
