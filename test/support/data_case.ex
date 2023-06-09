defmodule ExInventory.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case, async: true
      import Ecto.Query
      import ExInventory.DataCase
      import ExInventory.Factory

      alias Ecto.Changeset
      alias ExInventory.Repo

      @moduletag capture_log: true
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ExInventory.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ExInventory.Repo, {:shared, self()})
    end

    on_exit(fn ->
      ExInventory.Sku.Supervisor
      |> DynamicSupervisor.which_children()
      |> Enum.map(fn {_, pid, _, _} -> pid end)
      |> Enum.map(fn pid -> DynamicSupervisor.terminate_child(ExInventory.Sku.Supervisor, pid) end)
    end)

    :ok
  end
end
