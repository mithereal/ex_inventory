defmodule ExInventory.Cldr do
  @moduledoc false
  use Cldr,
    locales: Application.compile_env(:ex_inventory, :locales, ["en"]),
    default_locale: Application.compile_env(:ex_inventory, :default_locale, "en"),
    providers: [Cldr.Number, Money]
end
