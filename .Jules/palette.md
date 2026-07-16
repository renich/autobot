## 2024-07-24 - CLI Output Buffering
**Learning:** In Crystal CLI applications, `print` statements without a newline character do not immediately output to the terminal because `STDOUT` is line-buffered by default.
**Action:** Always follow `print` statements that show a prompt or loading indicator (e.g., `print "Thinking..."`) with `STDOUT.flush` to ensure immediate visual feedback for the user.
