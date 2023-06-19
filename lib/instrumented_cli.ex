defmodule InstrumentedCLI do
  use OpenTelemetryDecorator

  @decorate trace("instrumented_cli.command")
  def command do
    IO.puts "asdf"
  end
end
