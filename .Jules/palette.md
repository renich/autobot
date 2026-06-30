## 2024-05-18 - Fix CLI output buffering in Crystal
**Learning:** Crystal CLI applications buffer standard output by default. This causes `print` statements (used for prompts like "You: " or loading states like "Thinking...") to not appear immediately, making the interaction feel laggy or unresponsive.
**Action:** Always append `STDOUT.flush` after `print` statements in Crystal CLI tools to ensure immediate visual feedback for prompts and loading states.
