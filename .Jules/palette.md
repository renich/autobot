## 2026-06-28 - Immediate Feedback in CLI
**Learning:** CLI outputs buffered via `print` (instead of `puts`) do not display immediately to the user until flushed or a newline is sent. This can cause interactive elements like loading states (e.g. "Thinking...") and prompts (e.g. "You: ") to feel unresponsive or delayed, degrading the user experience.
**Action:** When building interactive CLI components in Crystal (or similar languages), explicitly call `STDOUT.flush` immediately after printing prompts or intermediate states to ensure instant visual feedback.
