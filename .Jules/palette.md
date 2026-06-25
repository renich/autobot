## 2026-06-25 - [Immediate Visual Feedback in CLI]
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, potentially causing prompts or loading states to be delayed until the next newline. This can negatively impact perceived performance and responsiveness.
**Action:** Append `STDOUT.flush` after `print` to ensure immediate visual feedback for prompts and loading states.
