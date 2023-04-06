defmodule ExInventory do
  @moduledoc """
  Documentation for `ExInventory`.
  """

  @repo ExInventory.Config.repo()

  @doc """
  get skus.

  ## Examples

      iex> ExInventory.skus()
      []

  """
  def skus do
    @repo.all(ExInventory.Schemas.Sku)
  end

  @doc """
  get item_by_sku.

  ## Examples

      iex> ExInventory.item_by_sku()
      []

  """
  def item_by_sku(sku) do
    @repo.get_by!(ExInventory.Schemas.Sku, :sku, sku)
    |> preload(:item)
  end
end
