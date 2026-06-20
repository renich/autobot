## 2024-05-18 - Missing Output Flushing in CLI Prompts
**Learning:** In Crystal CLI apps, `print` statements (unlike `puts`) do not automatically flush the output buffer to standard output, causing prompts and loading states to be visually delayed or hidden until more output is written or the buffer fills.
**Action:** Always append `.flush` to the corresponding output stream (e.g. `STDOUT.flush` or `output.flush`) immediately after calling `print` for interactive prompts and progress indicators.
