## 2025-01-01 - Prevent Stream Deadlocks in Crystal Process.new
**Vulnerability:** Calling `Process.new` with redirected pipes and reading them sequentially or breaking early from bounded reads causes deadlocks. Child processes hang when attempting to write to a full pipe, blocking the parent indefinitely.
**Learning:** Crystal's `Process` pipes use blocking I/O. If a parent reads `stdout` fully before reading `stderr`, and the child fills `stderr`, both will wait forever. Breaking out of bounded reads before EOF also causes the child to hang on write, leading to timeouts.
**Prevention:** Read `stdout` and `stderr` concurrently using `spawn` and `Channel`, use `select` with a timeout, and continue discarding excess data in the reading loop until EOF instead of breaking.
