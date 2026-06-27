## 2026-06-27 - [CLI Output Buffering]
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer. This can cause interactive prompts (like "Thinking..." or "Overwrite? [y/N]") to not display immediately before the program pauses for input.
**Action:** Always append `STDOUT.flush` after `print` to ensure immediate visual feedback for prompts and loading states in Crystal CLI interfaces.
