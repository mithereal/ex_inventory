defmodule ExInventory do
  @moduledoc """
  Documentation for `ExInventory`.
  """

  @repo ExInventory.Config.repo()

  @doc """
  Hello world.

  ## Examples

      iex> ExInventory.skus()
      []

  """
  def skus do
     @repo.all(ExInventory.Schemas.Sku)
  end
end
