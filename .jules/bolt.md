## 2025-06-28 - Optimizing String Concatenation in Crystal

**Learning:** When constructing complex strings in Crystal, especially inside loops or methods called frequently, using `String.build` combined with `Enumerable#join(io, separator) { |element, io| ... }` is significantly faster and uses less memory than chaining `.map { ... }.join(" ")`. The `.map` allocates an intermediate array and intermediate strings, whereas writing directly to `IO::Memory` (which `String.build` provides) avoids these allocations. Our benchmark showed a ~50% speedup and reduced memory allocations.

**Action:** Replace `Array#map { ... }.join` patterns with `String.build { |io| Array#join(io, separator) { ... } }` in frequently called code paths like LLM context generation (`src/autobot/agent/context.cr`) and command building (`src/autobot/tools/bash_tool.cr`).
