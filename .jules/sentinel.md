## 2026-07-11 - Prevent SQLite Command Injection via Dot-Commands
**Vulnerability:** Untrusted SQLite queries executed via the `sqlite3` CLI could use dot-commands (e.g. `.shell` or `.system`) to execute arbitrary shell commands on the host.
**Learning:** By default, `sqlite3` CLI allows dangerous meta-commands unless specifically restricted.
**Prevention:** Always use the `-safe` flag when executing untrusted queries with the `sqlite3` CLI.
