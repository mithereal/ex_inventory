defmodule ExInventory.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(ExInventory.Server)
end
