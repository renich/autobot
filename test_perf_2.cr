require "benchmark"

Benchmark.ips do |x|
  channel = "telegram"
  chat_id = "123456789"

  x.report("+= append") do
    system_prompt = "This is a base system prompt."
    system_prompt += "\n\n## Current Session\nChannel: #{channel}\nChat ID: #{chat_id}"
  end

  x.report("String.build") do
    system_prompt = String.build do |str|
      str << "This is a base system prompt."
      str << "\n\n## Current Session\nChannel: " << channel << "\nChat ID: " << chat_id
    end
  end
end
