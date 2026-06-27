## 2024-05-15 - Command Injection in SQLite plugin
**Vulnerability:** The SQLite plugin (`src/autobot/plugins/builtin/sqlite.cr`) executed the `sqlite3` CLI without the `-safe` flag. This could allow command injection via SQLite dot-commands like `.shell` or `.system` if untrusted input was passed as a query.
**Learning:** Using an external CLI tool to process untrusted data introduces command injection risks specific to that tool's features, beyond just standard shell injection (which was mitigated by `shell_escape`). We must understand the capabilities of the tools we invoke.
**Prevention:** When executing the `sqlite3` CLI tool with untrusted queries, always append the `-safe` flag to prevent command injection vulnerabilities via SQLite dot-commands.
