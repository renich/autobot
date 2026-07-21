## 2024-05-14 - Replace Array#map.join with String.build for String construction
**Learning:** For strings and particularly arrays constructed and immediately joined as string, creating intermediate Arrays with map and then joining them causes unnecessary memory allocations and is less efficient.
**Action:** Use `String.build do |str|` and `Enumerable#join(str, separator)` instead. Also, avoid appending strings like `string += "... "` conditionally and instead use `String.build`. Note: skip this on cold paths like LLM prompts because nano-second gains are micro-optimizations.
