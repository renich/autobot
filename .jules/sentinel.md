## 2025-03-01 - Add `-safe` flag to `sqlite3` execution to prevent command injection
**Vulnerability:** The application executed the `sqlite3` CLI tool with untrusted queries, which could potentially allow command injection via SQLite dot-commands (e.g., `.shell`, `.system`).
**Learning:** Always use the `-safe` flag when executing `sqlite3` with untrusted input to disable potentially dangerous dot-commands.
**Prevention:** Make sure any new integrations or usages of the `sqlite3` command line utility include the `-safe` flag by default.
