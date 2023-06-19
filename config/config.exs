# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :open_telemetry_decorator, attr_prefix: "app."
config :open_telemetry_decorator, attr_joiner: "."

config :opentelemetry, :resource, service: [name: "experiments"]
config :opentelemetry, traces_exporter: {:otel_exporter_stdout, []}

#key = System.fetch_env!("HONEYCOMB_KEY")

#config :opentelemetry_exporter,
#  otlp_endpoint: "https://api.honeycomb.io:443",
#  otlp_headers: [{"x-honeycomb-team", key}]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# import_config "#{config_env()}.exs"
