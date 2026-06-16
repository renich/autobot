## 2025-02-28 - String Concatenation vs IO::Memory
**Learning:** In Crystal, appending characters to a string in a loop using `+=` creates a new string allocation on every iteration, leading to O(n²) memory complexity and slower execution.
**Action:** Replace string concatenation in loops with `IO::Memory.new` and append via `<<`. This drastically reduces memory allocations and significantly speeds up processing.
