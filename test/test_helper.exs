Application.ensure_all_started(:ex_machina)

Ecto.Adapters.SQL.Sandbox.mode(ExInventory.Repo, :manual)

ExUnit.start()
