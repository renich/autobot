## 2024-05-24 - SQLite Command Injection via Dot-Commands
**Vulnerability:** Command injection via SQLite CLI dot-commands (e.g., `.shell`, `.system`) when handling untrusted queries without the `-safe` flag.
**Learning:** Untrusted SQL queries can exploit the `sqlite3` CLI tool by utilizing built-in dot-commands that execute shell commands or write to arbitrary files, escaping intended database bounds.
**Prevention:** Always append the `-safe` flag to the `sqlite3` CLI invocation when executing queries or handling input. This restricts dot-commands and enforces a secure execution environment.
