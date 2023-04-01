defmodule ExInventory.Schemas.Item do
  @moduledoc """
The basic unit of inventory. every item can be in a registry by status on_hand etc
"""

  defstruct title: "", sku: "", data: %{}
end
