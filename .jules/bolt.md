## 2025-02-12 - Crystal Memory Optimization
**Learning:** In Crystal CLI applications and strings processing, using `+=` for string concatenation within loops allocates memory inefficiently. `IO::Memory` is preferred to significantly improve performance and reduce memory allocations.
**Action:** Replace string concatenation in loops with `IO::Memory` and appropriate writes.
