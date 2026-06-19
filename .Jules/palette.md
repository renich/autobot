## 2024-06-19 - Crystal CLI Buffering
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer. This causes missing visual feedback for prompts and loading states until a newline is printed.
**Action:** Always append `STDOUT.flush` after `print` statements to ensure immediate visual feedback for prompts and loading states.
