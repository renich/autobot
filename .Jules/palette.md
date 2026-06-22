## 2024-11-20 - CLI Output Buffering
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, making loading indicators or prompts invisible until a newline is printed.
**Action:** Always append `STDOUT.flush` after `print` statements to ensure immediate visual feedback.
