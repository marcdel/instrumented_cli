defmodule InstrumentedCLI.TraceFlusher do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    IO.puts("Starting up the flusher 🧻")
    Process.flag(:trap_exit, true)
    {:ok, nil}
  end

  def terminate(_reason, _state) do
    IO.puts("Flushing traces 🚽")
    :otel_tracer_provider.force_flush()
    Application.stop(:opentelemetry)
  end
end
