require "benchmark"

media = Array(NamedTuple(type: String, url: String)).new
100.times { |i| media << {type: "image", url: "https://example.com/image_#{i}.jpg"} }

Benchmark.ips do |x|
  x.report("map.join") do
    media.map { |attachment| "[#{attachment[:type]}: #{attachment[:url]}]" }.join("\n")
  end
  x.report("String.build") do
    String.build do |str|
      media.each_with_index do |attachment, index|
        str << "\n" if index > 0
        str << "[" << attachment[:type] << ": " << attachment[:url] << "]"
      end
    end
  end
  x.report("join(io, sep)") do
    String.build do |str|
      media.join(str, "\n") do |attachment, io|
        io << "[" << attachment[:type] << ": " << attachment[:url] << "]"
      end
    end
  end
end
