## 2024-07-01 - Immediate Feedback in Crystal CLI
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, causing prompts or loading text to not appear immediately until a newline is printed or buffer fills.
**Action:** Always append `STDOUT.flush` after `print` statements used for user prompts or loading states to ensure immediate visual feedback.
