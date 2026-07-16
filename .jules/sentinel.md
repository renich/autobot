## 2025-02-14 - IPv4-mapped IPv6 Address SSRF Bypass
**Vulnerability:** The WebFetchTool's SSRF protection could be bypassed using IPv4-mapped IPv6 addresses (e.g. `http://[::ffff:127.0.0.1]/`).
**Learning:** `Socket::Addrinfo.resolve` in Crystal returns IPv4-mapped IPv6 strings (like `::ffff:127.0.0.1`) when parsing these types of addresses. Simple string prefix checks (like `ip.starts_with?("127.")`) will fail on these mapped addresses, allowing attackers to bypass SSRF blacklists.
**Prevention:** Strip the `::ffff:` prefix from IP address strings before running validation rules to ensure both standard IPv4 and IPv4-mapped IPv6 formats are correctly evaluated against the blacklist.
