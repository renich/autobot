## 2024-07-13 - Command Injection via SQLite dot-commands
**Vulnerability:** Command injection vulnerability in SQLitePlugin through untrusted SQL queries containing dot-commands like `.shell` or `.system`.
**Learning:** Even though the LLM is sandboxed, untrusted SQL input fed directly into the `sqlite3` CLI without the `-safe` flag can lead to unintended command execution within the sandbox, potentially bypassing some restrictions or causing unexpected behavior.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI tool to prevent the execution of potentially dangerous dot-commands.
