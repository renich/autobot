## 2024-05-24 - CLI Prompts and Loading States Buffer Flushing
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, resulting in a delayed display of prompts and loading indicators (like 'Thinking...') until the next newline. This creates a confusing UX where it seems like the CLI is hung or not acknowledging user input.
**Action:** Always append `STDOUT.flush` immediately after any `print` statement used for visual feedback or interactive prompts in the CLI to ensure immediate rendering.
