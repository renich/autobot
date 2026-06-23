
## 2025-02-28 - Crystal Enumerable#join(io) Optimization
**Learning:** Crystal's `Enumerable#join` can take an `IO` and a block, allowing elements to be written directly to the stream instead of allocating an intermediate Array and generating an intermediate string for each element before combining them.
**Action:** When constructing complex strings from collections (e.g. `array.map { |x| "#{x}" }.join`), refactor to `String.build do |io| array.join(io, sep) { |x, i| i << x } end` to avoid memory allocations and reduce GC pressure.
