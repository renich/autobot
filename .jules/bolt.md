## 2024-06-25 - Avoid String Array Allocations with String.build
**Learning:** Constructing complex strings with `Array#map` and `Array#join` creates unnecessary intermediate objects. This creates GC pressure, especially within frequently called paths like context construction.
**Action:** Use `String.build` combined with `Enumerable#join(io, separator) { |element, io| ... }` to directly write to the IO stream without creating intermediate collections.
