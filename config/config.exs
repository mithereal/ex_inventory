# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
import Config


config :ex_inventory, :ecto_repos, [ExInventory.Repo.Null]


import_config "#{Mix.env()}.exs"
