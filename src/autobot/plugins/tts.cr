require "./plugin"
require "../tools/result"

module Autobot
  module Plugins
    # Custom plugin to convert text to speech using gTTS.
    class TextToSpeechPlugin < Plugin
      def name : String
        "text_to_speech"
      end

      def description : String
        "Convert text to a voice message using gTTS and ffmpeg"
      end

      def version : String
        "0.1.0"
      end

      def setup(context : PluginContext) : Nil
        context.tool_registry.register(TextToSpeechTool.new(context.workspace))
      end
    end

    # Custom tool to perform TTS generation.
    class TextToSpeechTool < Tools::Tool
      @workspace : Path

      def initialize(@workspace : Path)
      end

      def name : String
        "text_to_speech"
      end

      def description : String
        "Converts written text into a spoken voice file (voice.ogg). Call this tool with the text to say, and then use the message tool with file_path='voice.ogg' to send it to the user."
      end

      def parameters : Tools::ToolSchema
        Tools::ToolSchema.new(
          properties: {
            "text" => Tools::PropertySchema.new(
              type: "string",
              description: "The text message to convert to speech"
            ),
            "lang" => Tools::PropertySchema.new(
              type: "string",
              description: "Language code: 'es' for Spanish, 'en' for English, etc. (default: 'es')",
              default_value: "es"
            ),
          },
          required: ["text"]
        )
      end

      def execute(params : Hash(String, JSON::Any)) : Tools::ToolResult
        text = params["text"].as_s
        lang = params["lang"]?.try(&.as_s) || "es"

        # Output paths resolved within the workspace directory
        mp3_path = (@workspace / "temp_voice.mp3").to_s
        ogg_path = (@workspace / "voice.ogg").to_s

        # Runtime dependency check
        unless system_cmd_exists?("gtts-cli")
          return Tools::ToolResult.error("gtts-cli is not installed or available in PATH. Install it via 'pip install gtts'.")
        end
        unless system_cmd_exists?("ffmpeg")
          return Tools::ToolResult.error("ffmpeg is not installed or available in PATH.")
        end

        begin
          # Clean up old voice files
          File.delete(mp3_path) if File.exists?(mp3_path)
          File.delete(ogg_path) if File.exists?(ogg_path)

          # 1. Run gtts-cli to generate MP3
          gtts_status = Process.run(
            "gtts-cli",
            ["--lang", lang, text, "--output", mp3_path],
            error: Process::Redirect::Close
          )

          unless gtts_status.success?
            return Tools::ToolResult.error("Failed to generate speech using gtts-cli.")
          end

          unless File.exists?(mp3_path)
            return Tools::ToolResult.error("gtts-cli succeeded but temp_voice.mp3 was not created.")
          end

          # 2. Run ffmpeg to convert to Opus OGG (native Telegram voice codec)
          ffmpeg_status = Process.run(
            "ffmpeg",
            ["-y", "-i", mp3_path, "-acodec", "libopus", ogg_path],
            error: Process::Redirect::Close
          )

          unless ffmpeg_status.success?
            return Tools::ToolResult.error("Failed to convert audio using ffmpeg.")
          end

          unless File.exists?(ogg_path)
            return Tools::ToolResult.error("ffmpeg completed but voice.ogg was not created.")
          end

          Tools::ToolResult.success("Voice file generated successfully at voice.ogg. Now call the message tool with file_path='voice.ogg' and content='[Voice message]' to deliver it.")
        rescue ex
          Tools::ToolResult.error("Error generating text-to-speech: #{ex.message}")
        ensure
          # Clean up temp file
          File.delete(mp3_path) if File.exists?(mp3_path)
        end
      end

      private def system_cmd_exists?(cmd : String) : Bool
        Process.run("which", [cmd], error: Process::Redirect::Close).success?
      rescue
        false
      end
    end
  end
end

# Register the plugin
Autobot::Plugins::Loader.register(Autobot::Plugins::TextToSpeechPlugin.new)
