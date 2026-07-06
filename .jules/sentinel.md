## 2025-07-06 - SQLite dot-command injection
**Vulnerability:** Untrusted user input executed via `sqlite3` CLI could inject SQLite dot-commands (like `.shell` or `.system`), allowing arbitrary command execution even if SQL injection was prevented.
**Learning:** The SQLite CLI has powerful dot-commands that operate outside of standard SQL evaluation. When wrapping the CLI in a sandboxed or unsandboxed tool to execute dynamic queries or scripts, these dot-commands present a critical risk if input isn't properly restricted.
**Prevention:** Always append the `-safe` flag to the `sqlite3` command invocation. This flag specifically disables `.shell`, `.system`, and other potentially dangerous operations when using the CLI non-interactively.
