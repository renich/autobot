## 2024-06-25 - [Crystal Performance Optimization - String.build vs Array#map.join]
**Learning:** In Crystal, `String.build` combined with `Enumerable#join(io, separator) { |element, io| ... }` over `Array#map` combined with `join` for constructing complex strings directly writes to the IO stream, avoiding intermediate array and string allocations, and improves runtime performance.
**Action:** Use `String.build` and `Enumerable#join` where possible instead of `Array#map.join` for concatenating arrays.
