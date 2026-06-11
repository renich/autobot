## 2024-05-19 - Flush CLI print buffers for responsive loading states
**Learning:** Crystal's `print` statements without newlines are buffered and may not display immediately in the CLI, causing loading states like "Thinking..." to appear unresponsive.
**Action:** Always add `STDOUT.flush` after `print` statements that serve as prompts or loading indicators before long-running operations or waiting for input to ensure immediate visibility.
