## 2024-06-03 - Avoid intermediate arrays during string mapping in Crystal
**Learning:** When formatting an array of objects into a single string (e.g., mapping properties and joining), mapping the array into strings creates unnecessary intermediate string allocations and an intermediate array.
**Action:** Use `String.build do |io|` and directly construct the string within an `Enumerable#join(io, separator) { |element, item_io| ... }` block to write elements directly into the string builder, eliminating intermediate allocations.
