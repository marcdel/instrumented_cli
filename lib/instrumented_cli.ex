defmodule InstrumentedCLI do
  use OpenTelemetryDecorator

  @decorate trace("instrumented_cli.command")
  def command do
    IO.puts("Starting the application 🚀")
    Application.ensure_all_started(:instrumented_cli)

    do_command()

    IO.puts("Stopping the application 🛑")
    Application.stop(:instrumented_cli)
  end

  @decorate trace("instrumented_cli.do_command")
  defp do_command do
    IO.puts("Running command 🏃‍♂️")
    Process.sleep(1_000)
  end
end
