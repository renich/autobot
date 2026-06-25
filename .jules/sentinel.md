## 2024-10-27 - [Command Injection via SQLite CLI]
**Vulnerability:** The SQLite plugin executed the `sqlite3` CLI tool with untrusted parameters without restrictions, leading to potential command injection via SQLite dot-commands (e.g., `.system`).
**Learning:** Even when SQL queries are conceptually "safe" to execute in an isolated database, invoking the `sqlite3` CLI directly exposes the system to its built-in interactive commands if not disabled.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI to disable unsafe features like `.shell`, `.system`, and file operations.
