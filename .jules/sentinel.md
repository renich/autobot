## 2025-05-18 - Bubblewrap Environment Variable Leak
**Vulnerability:** When running isolated commands via Bubblewrap (`bwrap`), host environment variables (including secrets like `API_KEY`s) were passed through by default and leaked into the sandboxed environment.
**Learning:** Bubblewrap does not isolate environment variables automatically. The `--clearenv` flag is required.
**Prevention:** Always use `--clearenv` when spawning `bwrap` sandboxes and explicitly whitelist required variables using `--setenv`.
