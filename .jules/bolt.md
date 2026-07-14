## 2026-07-14 - String concatenation in context builder

**Learning:** When building context strings, especially with collections like media attachments, using `Array#map` with string interpolation and then `Array#join` allocates multiple intermediate strings and arrays. This is measurably slower (by ~1.44x) than using `String.build` combined with `Enumerable#join(io, separator)`.
**Action:** Always prefer `String.build` with `Enumerable#join(io, separator)` for constructing complex strings over `Array#map` + `join` in Crystal to reduce allocations and improve performance, as outlined in the core memory principles.
