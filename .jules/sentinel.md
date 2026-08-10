## 2025-03-26 - Fix DoS and stream deadlocks in Telegram channel script execution
**Vulnerability:** Unbounded `process.wait` and sequential stream reading in `Process.new` execution.
**Learning:** Sequential reading of child process pipes can cause stream deadlocks if stderr fills the OS pipe buffer while the parent reads stdout. Unbounded waiting allows a long-running child to DoS the telegram bot by blocking the command processing fiber forever.
**Prevention:** Always spawn separate fibers and channels for reading stdout and stderr concurrently, catch `IO::Error` to prevent fiber crashes, drain pipes with `skip_to_end` after truncating, and wrap `process.wait` with a timeout using `select`.
