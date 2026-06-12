## 2024-05-24 - IO::Memory String Concatenation Performance
**Learning:** In Crystal, using string concatenation `+=` in loops for building up strings is highly inefficient, leading to excessive allocations and performance degradation, especially for longer strings. Using `IO::Memory` is drastically faster and reduces allocations by a large margin.
**Action:** Always prefer `IO::Memory` when building strings dynamically within loops in Crystal code.
