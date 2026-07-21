def get_lines
  lines = [] of String
  lines << "line1"
  lines << "line2"
  lines.join("\n")
end

def get_lines_build
  String.build do |str|
    str << "line1"
    str << "\n"
    str << "line2"
  end
end

require "benchmark"
Benchmark.ips do |x|
  x.report("Array<< and join") { get_lines }
  x.report("String.build") { get_lines_build }
end
