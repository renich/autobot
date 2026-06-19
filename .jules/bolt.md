## 2025-03-01 - Perceived Performance with CLI Printing in Crystal
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer. This causes delays in displaying prompts and loading states ("Thinking..."), significantly worsening the perceived performance of interactive tools.
**Action:** Always append `STDOUT.flush` immediately after `print` statements in Crystal CLI applications to ensure immediate visual feedback for the user.
