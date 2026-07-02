## 2024-05-30 - [Command Injection via SQLite Dot-Commands]
**Vulnerability:** Untrusted inputs containing SQLite dot-commands (e.g. `.system`) can be executed via the `sqlite3` CLI, bypassing some command validation constraints.
**Learning:** SQLite's command-line tool allows executing shell commands through specific dot-commands, which can lead to command injection if input isn't properly sanitized or the environment isn't restricted.
**Prevention:** Ensure `-safe` flag is passed to `sqlite3` invocation when running untrusted queries to prevent command injection via dot commands.
