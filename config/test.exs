import Config
# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

config :ex_inventory, :ecto_repos, [ExInventory.Repo.Null]
