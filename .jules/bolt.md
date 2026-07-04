## 2024-03-24 - Avoid `.map.join` for string building
**Learning:** In Crystal, combining `Array#map` with `join` creates an intermediate array and an intermediate string for every element, which leads to unnecessary memory allocations and pressure on the garbage collector. This is a common performance anti-pattern.
**Action:** Replace `.map { ... }.join("...")` with `String.build { |io| collection.join(io, "...") { |element, io| io << "..." } }`. This allows elements to be written directly to the output IO stream without creating intermediate collections.
