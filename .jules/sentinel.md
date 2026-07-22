## 2024-05-24 - SQLite Command Injection via Dot-Commands
**Vulnerability:** The SQLite plugin executed user-provided SQL queries using the `sqlite3` CLI without the `-safe` flag, allowing command injection via dot-commands like `.shell`.
**Learning:** The `sqlite3` CLI tool can execute arbitrary shell commands using dot-commands (e.g., `.shell`, `.system`) unless explicitly disabled.
**Prevention:** When executing the `sqlite3` CLI tool with untrusted queries, always append the `-safe` flag to prevent command injection vulnerabilities.
