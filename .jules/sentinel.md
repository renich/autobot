## 2024-06-25 - Command injection vulnerability in sqlite3 execution
**Vulnerability:** Command injection vulnerabilities could happen when using SQLite dot-commands (e.g. `.shell` or `.system`) on unsanitized inputs due to missing the `-safe` flag on `sqlite3` executions.
**Learning:** The `-safe` flag prevents SQLite from executing system commands which makes the CLI tool a secure tool even on untrusted user inputs.
**Prevention:** Append the `-safe` flag to all `sqlite3` CLI executions.
