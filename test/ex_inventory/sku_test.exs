defmodule ExInventory.SkuTest do
  use ExInventory.DataCase

  #  alias ExInventory.Schema.Sku

  test "list_skus/0 lists all skus" do
    sku =
      :sku
      |> insert()
      |> supervise()

    assert ExInventory.skus() == [sku]
  end

  #
  test "list_skus/1 filters to list only given sku ids" do
    skus = 4 |> insert_list(:sku) |> supervise()
    _false_skus = 8 |> insert_list(:sku) |> supervise()

    ids = Enum.map(skus, & &1.sku)
    result = Enum.map(skus, &%{sku: &1.sku})

    assert ExInventory.Sku.list_skus(ids) == result
  end

  test "get_sku/1 finds a sku by ID" do
    sku = :sku |> insert() |> supervise()
    assert ExInventory.Sku.get_sku(sku.sku) == %{sku: sku.sku}
  end

  test "get_sku/1 returns nil if sku doesn't exist or is not supervised" do
    sku = build(:sku)
    assert ExInventory.Sku.get_sku(sku.id) == nil
  end
end
