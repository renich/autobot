## 2026-06-13 - [HIGH] Uncontrolled Memory Consumption and Pipe Deadlocks
**Vulnerability:** IO pipes were read using unbounded `gets_to_end` leading to Out-Of-Memory (OOM) Denial-of-Service, or were read with a size limit but broken out early leading to child process deadlocks.
**Learning:** Crystal's `gets_to_end` allocates memory bounded only by available RAM, and breaking out of an `IO.read` loop on a pipe prevents the OS from flushing the pipe buffer, causing child processes to hang on `write` forever.
**Prevention:** Always read from pipes using a size-limited buffer chunking loop that keeps reading and discarding excess data until EOF instead of breaking early.
