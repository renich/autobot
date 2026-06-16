## 2024-06-14 - Information Leakage via Stack Traces
**Vulnerability:** Explicit logging of exception stack traces (`ex.backtrace.join` or `ex.inspect_with_backtrace`) in various tools, the main agent loop, and HTTP providers.
**Learning:** This exposes internal file paths, framework details, and system configurations directly to logs. Since the logging system already handles exceptions generically through `logging.cr`, explicit backtrace logging is unnecessary and dangerous in production.
**Prevention:** Avoid manually appending stack traces to error logs. Let the unified logger handle sanitized exception information, ensuring internal structure is hidden.
