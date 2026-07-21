require "benchmark"

chunk_size = 4096
max_size = 10_000

Benchmark.ips do |x|
  x.report("Math.max") do
    bytes_read = 12000
    n = 4096
    Math.max(0, max_size - (bytes_read - n))
  end
  x.report("int compare") do
    bytes_read = 12000
    n = 4096
    val = max_size - (bytes_read - n)
    val > 0 ? val : 0
  end
end
