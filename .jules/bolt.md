## 2024-05-18 - Replacing chained mapping with String.build for multi-part string building
**Learning:** Crystal is extremely memory-intensive for intermediate object instantiations when using map and join strings together. `Array#map` paired with `join` constructs two things: a new `Array`, and the individual concatenated strings themselves.
**Action:** Always favor `String.build do |io|` and `Enumerable#join(io, sep) { |item, io2| }` when generating composite strings, saving allocations by skipping intermediate arrays and directly targeting the IO stream.
