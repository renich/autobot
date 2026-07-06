## 2024-05-18 - String.build vs map.join in Crystal
**Learning:** Using `Array#map` combined with `join` creates multiple intermediate arrays and string objects. In Crystal, `String.build` allows you to stream content to an `IO::Memory` buffer efficiently without these allocations.
**Action:** When constructing complex strings from collections, prefer `String.build` with `Enumerable#join(io, separator) { |item, io| ... }` over mapping and joining strings, especially in heavily used paths like context building.
