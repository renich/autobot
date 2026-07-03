## 2026-07-03 - String Building optimization
**Learning:** Using `String.build` combined with `Enumerable#join(io, separator) { |element, io| ... }` is faster and allocates less memory compared to mapping over an array and calling join on it, because it avoids intermediate array and string allocations.
**Action:** Use `String.build` and `join(io)` in critical paths to avoid intermediate allocations when formatting lists into strings.
