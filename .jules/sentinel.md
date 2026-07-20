## 2026-07-20 - [SQLite CLI Command Injection]
**Vulnerability:** Command injection via SQLite `.shell` or `.system` dot-commands when running the CLI with untrusted SQL queries (even if shell-escaped).
**Learning:** Using `Process.run` to call `sqlite3` without restrictive flags exposes internal CLI commands that execute arbitrary code. Shell escaping the arguments does not prevent malicious query content from accessing these dot-commands.
**Prevention:** Always use the `-safe` flag when executing `sqlite3` CLI tools to sandbox execution and prevent arbitrary disk access or code execution.
