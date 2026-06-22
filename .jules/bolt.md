## 2024-06-22 - Avoid Array#map with join for String Construction
**Learning:** In Crystal, `Array#map` combined with `join` creates intermediate array allocations which add overhead. For example, `args.map { |arg| shell_escape(arg) }.join(" ")` allocates a new array before joining.
**Action:** Replace `Array#map` and `join` with `String.build` when constructing strings from collections. This constructs the string directly into an `IO::Memory` buffer, avoiding intermediate allocations and significantly improving runtime performance and memory efficiency.
