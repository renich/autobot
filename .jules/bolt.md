## 2026-06-25 - String join optimizations
**Learning:** Replaced Array#map + join with String.build and Enumerable#join(io, separator) for improved performance by avoiding intermediate array and string allocations.
**Action:** Prefer Enumerable#join(io) over mapping and joining arrays when possible for constructing complex strings.
