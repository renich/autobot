## 2024-06-20 - Array#map combined with join
**Learning:** Using `Array#map` combined with `join` allocates an intermediate array and creates unnecessary strings.
**Action:** Replace `Array#map { ... }.join` with `String.build` and `Array#join(io, separator) { |item, io2| ... }` when performance matters, especially with large collections or inside hot paths.
