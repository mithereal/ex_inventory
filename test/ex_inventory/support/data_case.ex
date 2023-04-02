defmodule ExInventory.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Ecto.Query
      import Mox, only: [set_mox_from_context: 1]
      import ExInventory.DataCase
      import ExInventory.Factory

      alias Ecto.Changeset
      alias ExInventory.Repo

      @moduletag capture_log: true

      setup :set_mox_from_context
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ExInventory.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ExInventory.Repo, {:shared, self()})
    end

    on_exit(fn ->
      ExInventory.ComponentSupervisor
      |> DynamicSupervisor.which_children()
      |> Enum.map(fn {_, pid, _, _} -> pid end)
      |> Enum.map(fn pid -> ExInventory.terminate_child(ExInventory.ComponentSupervisor, pid) end)

      ExInventory.SkuSupervisor
      |> DynamicSupervisor.which_children()
      |> Enum.map(fn {_, pid, _, _} -> pid end)
      |> Enum.map(fn pid -> DynamicSupervisor.terminate_child(ExInventory.SkuSupervisor, pid) end)
    end)

    :ok
  end
end
