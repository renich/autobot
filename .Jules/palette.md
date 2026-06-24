## 2024-06-24 - CLI Output Buffering
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, which can cause prompt text to hang before appearing.
**Action:** Always append `STDOUT.flush` after `print` statements when immediate visual feedback is needed (e.g., prompts, loading states).
