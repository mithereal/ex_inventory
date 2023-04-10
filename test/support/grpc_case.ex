defmodule ExInventory.GRPCCase do
  use ExUnit.CaseTemplate, async: true

  require Logger

  @servers [ExInventory.Server]

  using do
    quote do
      import ExInventory.GRPCCase
    end
  end

  setup do
    {:ok, _pid, port} = GRPC.Server.start(@servers, 0)
    {:ok, channel} = GRPC.Stub.connect("localhost:#{port}")

    on_exit(fn ->
      :ok = GRPC.Server.stop(@servers)
    end)

    %{channel: channel}
  end
end
