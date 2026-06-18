## 2025-02-28 - Buffered standard output delays visual feedback in CLI
**Learning:** In Crystal (and many other languages), `STDOUT` is line-buffered by default. This means `print` statements that lack a newline character won't immediately display on the user's terminal, causing a poor UX where the application appears to hang before requesting input or showing a "Thinking..." indicator.
**Action:** Always append `STDOUT.flush` immediately after `print` statements in CLI applications to guarantee immediate visual feedback to the user.
