## 2024-05-18 - [Prevent SQLite Command Injection]
**Vulnerability:** When executing the `sqlite3` CLI tool with untrusted queries, there is a risk of command injection via SQLite dot-commands (e.g., `.shell`, `.system`).
**Learning:** SQLite's `.shell` and `.system` commands allow arbitrary command execution. Passing user input directly to the `sqlite3` CLI tool can allow a user to execute shell commands.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI tool with untrusted queries to prevent command injection vulnerabilities via SQLite dot-commands.