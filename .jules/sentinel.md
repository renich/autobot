## 2024-06-11 - SQLite CLI Command Injection via Dot-Commands
**Vulnerability:** The SQLite plugin passed user-provided SQL queries directly to the `sqlite3` CLI tool. Although `shell_escape` protected against Bash injections, it did not prevent attackers from passing SQLite dot-commands like `.shell` or `.system`, which can result in Remote Code Execution (RCE).
**Learning:** Shell escaping an argument is not sufficient when the target CLI tool has its own internal shell execution capabilities or dangerous directives.
**Prevention:** Always use the `-safe` flag when executing the `sqlite3` CLI tool with untrusted inputs to disable dangerous dot-commands.
