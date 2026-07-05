## 2024-05-24 - Command Injection via SQLite CLI
**Vulnerability:** SQLite CLI allows command execution via dot-commands (e.g. `.system`, `.shell`), which can lead to remote code execution if user input is passed unsanitized to the CLI tool.
**Learning:** Calling the CLI utility directly via `Process.new` or `exec` with untrusted queries opens the application up to these features which aren't always anticipated when using simple databases.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI tool with untrusted queries to prevent command injection vulnerabilities.
