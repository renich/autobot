require "benchmark"

Benchmark.ips do |x|
  channel = "telegram"
  chat_id = "123456789"

  x.report("+= append") do
    system_prompt = "This is a base system prompt."
    system_prompt += "\n\n## Current Session\nChannel: #{channel}\nChat ID: #{chat_id}"
  end

  x.report("String interpolation") do
    base = "This is a base system prompt."
    system_prompt = "#{base}\n\n## Current Session\nChannel: #{channel}\nChat ID: #{chat_id}"
  end
end
