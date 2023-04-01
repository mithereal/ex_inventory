defmodule ExInventory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  def start(_type, _args) do
    children = [
      {Registry, keys: :duplicate, name: :on_hand},
      {Registry, keys: :duplicate, name: :back_ordered},
      {Registry, keys: :duplicate, name: :in_transit},
    ]

    opts = [strategy: :one_for_one, name: ExInventory.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
