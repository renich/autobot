## 2024-06-25 - CLI Prompt and Loading State Feedback Delay
**Learning:** In Crystal CLI applications, `print` statements without a trailing newline do not automatically flush the output buffer. This causes immediate visual feedback delays for user prompts (e.g., "You: ") and loading states (e.g., "Thinking...").
**Action:** Always append `STDOUT.flush` immediately after `print` statements for interactive prompts and loading states to ensure immediate visual feedback for the user.
