defmodule ExInventory.Factory do
  use ExMachina.Ecto, repo: ExInventory.Repo

  alias ExInventory.Schemas.{Item, Sku, Location, Currency}

  def item_factory do
    %Item{
      title: "Test"
    }
  end

  def currency_factory do
    %Currency{
      name: "Test"
    }
  end

  def sku_factory do
    %Sku{
      sku: sequence(:sku, &"sku#{&1}")
    }
  end

  def supervise(records) when is_list(records), do: Enum.map(records, &supervise/1)

  #  def supervise(%Component{} = component) do
  #    with {:ok, _pid} <-
  #           DynamicSupervisor.start_child(
  #             ExInventory.ComponentSupervisor,
  #             {ExInventory.GenServers.Component, [component: component]}
  #           ) do
  #      component
  #    end
  #  end

  def supervise(%Sku{} = sku) do
    with {:ok, _pid} <-
           DynamicSupervisor.start_child(
             ExInventory.Sku.Supervisor,
             {ExInventory.Servers.Sku, sku.sku}
           ) do
      sku
    end
  end
end
