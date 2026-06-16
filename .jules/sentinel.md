## 2025-02-14 - Process Output Stream Deadlock & Missing Timeout
**Vulnerability:** Subprocess `stdout` and `stderr` were read sequentially using blocking IO, and the process was waited on without a timeout (`process.wait`).
**Learning:** If a subprocess outputs an unbounded amount to `stderr` while the parent is blocked reading `stdout`, the OS pipe buffer fills up and causes a deadlock. A lack of timeout on process execution also allows arbitrary hanging scripts to tie up main application resources (DoS).
**Prevention:** Use `spawn` and `Channel` to read `stdout` and `stderr` concurrently when executing subprocesses. Always wrap `process.wait` with a timeout mechanism (using `select`) to guarantee termination of rogue subprocesses.
