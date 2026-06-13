## 2025-03-09 - [Sandbox Env Leakage]
**Vulnerability:** Bubblewrap sandboxes inherited the host's environment variables by default, risking leakage of sensitive API keys from the autobot host environment to untrusted scripts.
**Learning:** `bwrap` passes all host environment variables unless `--clearenv` is explicitly provided.
**Prevention:** Always use `--clearenv` and explicitly forward whitelisted variables using `--setenv`.
