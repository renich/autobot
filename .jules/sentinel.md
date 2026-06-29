## 2024-05-24 - Command Injection via SQLite CLI dot-commands
**Vulnerability:** Untrusted queries passed to `sqlite3` CLI could trigger execution of local shell commands via `.shell` or `.system` dot-commands.
**Learning:** Even when inputs are securely shell-escaped, if they are passed directly to an interactive or batch processor like `sqlite3`, the processor itself might have built-in commands that allow arbitrary code execution.
**Prevention:** Always append the `-safe` flag when executing `sqlite3` CLI commands to disable dangerous capabilities like `.shell`, `.system`, and file reads/writes, ensuring it only processes standard SQL.
