## 2025-03-26 - Prevent DoS via Unbounded Process Execution and Stream Deadlocks
**Vulnerability:** The Telegram custom script runner used `process.wait` directly with bounded single-channel IO reading and no timeouts, leading to potential Denial of Service.
**Learning:** Using `process.wait` without reading `stdout` and `stderr` concurrently can lead to deadlocks where the child process blocks on writing to a full pipe, and never exits, exhausting resources.
**Prevention:** Always read `stdout` and `stderr` concurrently via channels and spawn, and use `select` with a timeout mechanism to gracefully kill processes instead of unbounded waiting. Moreover, catch `IO::Error` exceptions in the read fibers to preserve buffered data if pipes are closed asynchronously.
