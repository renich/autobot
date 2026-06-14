## 2024-06-14 - Optimize string concatenation in Crystal loops
**Learning:** In Crystal, using string concatenation (`+=`) inside loops leads to poor performance and excessive memory allocations because strings are immutable.
**Action:** Prefer using `IO::Memory` (a mutable byte buffer) inside loops and call `.to_s` to generate the final string. Clear the buffer with `.clear` to reuse it, further reducing allocations.
