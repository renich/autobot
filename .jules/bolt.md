## 2024-05-24 - Efficient String Building
**Learning:** Crystal's string concatenation using `+=` inside loops is very inefficient as it creates new string objects each iteration. This is particularly noticeable in parsers like `parse_args` in `BashTool` and `parse_script_args` in Telegram channel.
**Action:** Use `IO::Memory` instead of `+=` for string building in character-by-character parsers to reduce memory allocations and improve parsing performance.
