require "benchmark"

Benchmark.ips do |x|
  x.report("Math.max") do
    Math.max(0, 50 - 60)
  end
  x.report("int compare") do
    val = 50 - 60
    val > 0 ? val : 0
  end
end
