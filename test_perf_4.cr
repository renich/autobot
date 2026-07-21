require "benchmark"

media = Array(NamedTuple(type: String, url: String)).new
100.times { |i| media << {type: "image", url: "https://example.com/image_#{i}.jpg"} }

Benchmark.ips do |x|
  text = "This is a base text content."

  x.report("interpolation + map.join") do
    media_info = media.map { |attachment| "[#{attachment[:type]}: #{attachment[:url]}]" }.join("\n")
    content = "#{text}\n\nMedia:\n#{media_info}"
  end

  x.report("String.build") do
    content = String.build do |str|
      str << text
      str << "\n\nMedia:\n"
      media.join(str, "\n") do |attachment, io|
        io << "[" << attachment[:type] << ": " << attachment[:url] << "]"
      end
    end
  end
end
