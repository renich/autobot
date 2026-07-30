## 2024-05-18 - SQLite Command Injection via Dot-Commands
**Vulnerability:** Command injection vulnerability in SQLite plugin where untrusted inputs were passed directly to `sqlite3` without the `-safe` flag, allowing execution of dot-commands like `.shell` or `.system`.
**Learning:** The `sqlite3` CLI tool supports dot-commands that can execute arbitrary shell commands. When executing untrusted queries, these dot-commands can be abused.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI tool with untrusted queries to prevent command injection via dot-commands.
