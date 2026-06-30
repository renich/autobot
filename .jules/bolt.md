## 2024-05-24 - Optimize string building with map + join in Crystal
**Learning:** In Crystal, `.map` combined with `.join` causes unnecessary intermediate array and string allocations. `media.map { |x| ... }.join` allocates memory for both the array returned by `map` and its elements.
**Action:** Use `String.build do |io|` and directly invoke `.join(io, separator) { |element, io| ... }` on the Array to write elements straight to the stream without intermediate allocations.
