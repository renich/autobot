## 2025-03-03 - Prevent SQLite Command Injection
**Vulnerability:** Command injection via SQLite dot-commands (e.g., `.shell`, `.system`) when executing untrusted queries using the `sqlite3` CLI.
**Learning:** The `sqlite3` CLI tool by default allows executing arbitrary system commands using dot-commands, which can lead to remote code execution (RCE) if user input is not sanitized properly before passing it to the CLI.
**Prevention:** Always append the `-safe` flag when executing the `sqlite3` CLI tool to disable dot-commands and restrict dangerous functionalities.
