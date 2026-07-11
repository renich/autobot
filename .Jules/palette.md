## 2024-05-18 - Improve CLI UX Feedback
**Learning:** Crystal CLI applications do not automatically flush standard output (STDOUT) upon using `print`, which can cause prompts and visual feedback like 'Thinking...' to buffer until a newline is issued or the process terminates.
**Action:** Use `STDOUT.flush` immediately after `print` statements in interactive CLI commands to ensure immediate display for users.
