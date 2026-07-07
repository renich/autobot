## 2024-05-18 - Missing Output Flushing on `print` Statements
**Learning:** In Crystal CLI applications, when using `print` to output text without a trailing newline (e.g., interactive prompts, loading state like "Thinking..."), the standard output is buffered and the user may not see the prompt immediately.
**Action:** Always append `STDOUT.flush` immediately after `print` statements to ensure instant visual feedback for the user in CLI applications.
