defmodule ExInventoryTest do
  use ExUnit.Case
  doctest ExInventory

  test "greets the world" do
    assert ExInventory.hello() == :world
  end
end
