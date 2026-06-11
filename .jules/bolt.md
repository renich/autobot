## 2024-05-19 - Crystal string concatenation performance
**Learning:** String concatenation (`+= char.to_s`) inside a tight `each_char` loop is a massive performance bottleneck in Crystal because it allocates a new string for every single character added. This is much worse than using a mutable string builder.
**Action:** Always prefer `IO::Memory` or `String::Builder` for constructing strings in a loop. `IO::Memory` can be reused across iterations by calling `.clear`, making it extremely efficient for building multiple strings (like parsing command arguments).
