## 2024-07-05 - Immediate Visual Feedback in Crystal CLI
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer to STDOUT. This can cause prompts or "loading..." states to not appear until a newline is printed or the process exits, leading to a poor user experience where the CLI appears frozen.
**Action:** Always append `STDOUT.flush` immediately after `print` statements that expect user input or display ongoing progress to ensure immediate visual feedback.
