
## 2024-05-18 - Loading spinner for CLI
**Learning:** Adding a small dynamic spinner for long-running operations in CLI significantly improves the perceived responsiveness compared to a static "Thinking..." string.
**Action:** Use a background task (spawn) and terminal escape codes (`\r\e[K`) to dynamically update a text line, while using channels to properly cleanup when the operation completes.
