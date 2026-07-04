## 2024-05-24 - Prevent Command Injection in SQLite CLI via Dot-Commands
**Vulnerability:** The SQLite CLI (`sqlite3`) evaluates dot-commands (like `.shell` and `.system`) when executing untrusted queries. This could allow an attacker or malicious LLM output to perform command injection and execute arbitrary system commands via the query string.
**Learning:** Even though SQL string inputs are shell-escaped, `sqlite3` has built-in dot-commands that escape the SQL parsing logic and can be used to run OS commands.
**Prevention:** Always append the `-safe` flag to `sqlite3` CLI invocations to restrict the execution of dot-commands and prevent command injection.
