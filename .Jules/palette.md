## 2026-07-08 - Immediate Visual Feedback for CLI Prompts
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, which can delay visual feedback for interactive prompts and loading states.
**Action:** Add `STDOUT.flush` immediately after `print` statements that require immediate user visibility (e.g., input prompts, loading indicators) to ensure a responsive UX.
