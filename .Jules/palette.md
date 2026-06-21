## 2025-03-01 - CLI Instant Feedback
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer to the screen. This causes visual delays and can make the UI feel unresponsive, especially before blocking operations like `gets`.
**Action:** Always append `STDOUT.flush` immediately after `print` statements to ensure prompts and loading indicators (like "Thinking...") are immediately visible to the user.
