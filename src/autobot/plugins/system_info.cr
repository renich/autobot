require "./plugin"
require "../tools/result"

module Autobot
  module Plugins
    # Custom plugin to retrieve host system metrics.
    class SystemInfoPlugin < Plugin
      def name : String
        "system_info"
      end

      def description : String
        "Get host system metrics (CPU count, Memory usage, Uptime, Disk space)"
      end

      def version : String
        "0.1.0"
      end

      def setup(context : PluginContext) : Nil
        context.tool_registry.register(SystemInfoTool.new(context.workspace))
      end
    end

    # Custom tool to query system stats.
    class SystemInfoTool < Tools::Tool
      @workspace : Path

      def initialize(@workspace : Path)
      end

      def name : String
        "get_system_info"
      end

      def description : String
        "Returns CPU info, free RAM, uptime, and disk usage for the workspace mount of the host system."
      end

      def parameters : Tools::ToolSchema
        Tools::ToolSchema.new(
          properties: {} of String => Tools::PropertySchema,
          required: [] of String
        )
      end

      def execute(params : Hash(String, JSON::Any)) : Tools::ToolResult
        # Retrieve disk statistics for workspace directory
        df_out = IO::Memory.new
        Process.run("df", ["-h", @workspace.to_s], output: df_out)

        # Retrieve memory statistics
        free_out = IO::Memory.new
        Process.run("free", ["-h"], output: free_out)

        # Retrieve system uptime
        uptime_out = IO::Memory.new
        Process.run("uptime", output: uptime_out)

        # Retrieve CPU details
        cpu_out = IO::Memory.new
        Process.run("lscpu", output: cpu_out)
        cpu_line = cpu_out.to_s.lines.find(&.starts_with?("CPU(s):")) || "Unknown CPU count"

        content = <<-METRICS
        ### Host Metrics

        **Uptime:**
        #{uptime_out.to_s.strip}

        **CPU Info:**
        #{cpu_line.strip}

        **Memory Usage:**
        ```
        #{free_out.to_s.strip}
        ```

        **Disk Space (workspace):**
        ```
        #{df_out.to_s.strip}
        ```
        METRICS

        Tools::ToolResult.success(content)
      end
    end
  end
end

# Register the custom plugin for auto-loading
Autobot::Plugins::Loader.register(Autobot::Plugins::SystemInfoPlugin.new)
