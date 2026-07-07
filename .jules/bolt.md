## 2024-07-07 - Benchmark Crystal with --release
**Learning:** Benchmarking Crystal code without the `--release` flag produces misleading and inaccurate results that hide actual performance differences (e.g. `String.build` appeared slower than array allocation in development mode).
**Action:** Always run performance benchmarks (like `Benchmark.ips`) in Crystal using the `--release` flag (`crystal run --release file.cr`) to get true, optimized performance metrics.
