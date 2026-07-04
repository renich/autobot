## 2024-07-04 - Fix Delayed Visual Feedback in CLI
**Learning:** `print` statements in Crystal CLI applications do not automatically flush the output buffer, which causes delays in visual feedback for prompts and loading states.
**Action:** Append `STDOUT.flush` after `print` statements that need immediate rendering, such as interactive prompts or "Thinking..." loading indicators.
