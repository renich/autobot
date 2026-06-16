## 2025-02-14 - Redact basic auth credentials from URLs
**Vulnerability:** URLs containing basic authentication credentials (e.g. `http://user:password@example.com`) were logged in plain text when requested by the `WebFetchTool`.
**Learning:** Even if query parameters are sanitized, user credentials embedded directly in the URI scheme block can leak if the URI is stringified and logged.
**Prevention:** Use URI parsing to explicitly redact `uri.user` and `uri.password` fields before converting the URI back to a string for logging.
