## 2025-08-08 - Fixed process stream deadlocks
**Vulnerability:** Calling `Process.new` and reading stdout and stderr consecutively or using unbounded loops blocked the main thread causing Denial of Service (DoS).
**Learning:** Crystal's pipe implementations block indefinitely if the writer writes more than the OS buffer size before the reader consumes it. This resulted in stream deadlocks for child processes.
**Prevention:** Read stdout and stderr concurrently using channels and `spawn`, enforce timeouts using `select` with a grace period for cleanup, and use `io.skip_to_end` on capped readers to drain streams and unblock child processes.
