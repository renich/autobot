## 2026-07-13 - Added STDOUT.flush to print statements
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer, which leads to missing or delayed visual feedback for users during interactive prompts and loading states.
**Action:** Append `STDOUT.flush` after `print` to ensure immediate visual feedback.
