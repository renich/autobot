## 2024-05-24 - Missing STDOUT.flush after print in CLI prompts
**Learning:** In Crystal CLI applications, `print` statements do not automatically flush the output buffer. This can cause interactive prompts (like "Thinking..." or "You: ") to not appear immediately if they are not followed by a newline (`puts` flushes automatically).
**Action:** Always append `STDOUT.flush` after `print` to ensure immediate visual feedback for prompts and loading states.
## 2024-05-24 - String concatenation in loops vs String.build
**Learning:** In Crystal, `Array#map` followed by `join` allocates unnecessary intermediate arrays and strings. Using `String.build` combined with `Enumerable#join(io)` is significantly faster (often 2x-4x) and uses less memory, particularly for hot paths like context building.
**Action:** When constructing complex strings from collections, prefer `String.build { |io| collection.join(io) { |item, _io| ... } }` over `collection.map { |item| ... }.join`.
