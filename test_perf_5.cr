require "benchmark"

issues = [1, 2, 3]

Benchmark.ips do |x|
  x.report("string format") do
    "Summary: #{issues.size} errors"
  end
  x.report("String.build") do
    String.build do |str|
      str << "Summary: " << issues.size << " errors"
    end
  end
end
