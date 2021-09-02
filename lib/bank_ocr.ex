defmodule BankOcr do
  @moduledoc """
  This will be the entry point to connect the modules with themselves
  """
  alias BankOcr.Digits.Digit
  alias BankOcr.Utils.Util
require Logger
  @doc """
  Process accountss

  ## Examples

      iex> BankOcr.process_line_accounts("45750800066437149586110??36\n45750800066437149586110??36\n45750800066437149586110??36")
      "457508000 OK\n664371495 ERR\n86110??36 ILL"

  """
  @spec process_line_accounts(String.t()) :: String.t()
  def process_line_accounts(str_accounts) do
    Util.string_to_list(str_accounts)
    |> Enum.map(fn acc ->
      for <<x::binary-9 <- acc>>, do: x
    end)
    |> List.flatten()
    |> Digit.process_account_bulk()
    |> Util.list_to_string()
  end
end
