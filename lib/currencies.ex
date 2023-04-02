defmodule ExInventory.Currencies do
  @moduledoc false
  alias ExInventory.Schemas.Currency
  alias ExInventory.Config
  alias Money.ExchangeRates

  require Logger

  @repo Config.repo()

  def init(_pid, _table) do
    currencies = []

    Enum.map(currencies, fn x ->
      Cldr.Currency.new(x.symbol,
        cash_digits: x.cash_digits,
        cash_rounding: x.cash_rounding,
        code: x.code,
        digits: x.digits,
        from: x.from,
        iso_digits: x.iso_digits,
        name: x.name,
        narrow_symbol: x.narrow_symbol,
        rounding: x.rounding,
        symbol: x.symbol,
        tender: x.tender,
        to: x.to
      )
    end)
  end

  def new(params) do
    changeset = Currency.changeset(%Currency{}, params)
    {status, x} = @repo.insert(changeset)

    Logger.info("Loading New Currency: " <> x.name)

    if status == :ok do
      Cldr.Currency.new(x.symbol,
        cash_digits: x.cash_digits,
        cash_rounding: x.cash_rounding,
        code: x.code,
        digits: x.digits,
        from: x.from,
        iso_digits: x.iso_digits,
        name: x.name,
        narrow_symbol: x.narrow_symbol,
        rounding: x.rounding,
        symbol: x.symbol,
        tender: x.tender,
        to: x.to
      )
    end
  end

  def reload() do
    currencies = @repo.all(Currency)

    Logger.info("Reloading Currencies")

    Enum.map(currencies, fn x ->
      Cldr.Currency.new(x.symbol,
        cash_digits: x.cash_digits,
        cash_rounding: x.cash_rounding,
        code: x.code,
        digits: x.digits,
        from: x.from,
        iso_digits: x.iso_digits,
        name: x.name,
        narrow_symbol: x.narrow_symbol,
        rounding: x.rounding,
        symbol: x.symbol,
        tender: x.tender,
        to: x.to
      )
    end)
  end

  def convert(amount, dest_currency) do
    latest_rates = ExchangeRates.latest_rates()

    rates =
      case(latest_rates) do
        {:error, _rates} -> []
        {:ok, rates} -> rates
      end

    Money.to_currency(amount, dest_currency, rates)
  end
end
