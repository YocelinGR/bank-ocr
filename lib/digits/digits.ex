defmodule BankOcr.Digits.Digit do
  @moduledoc """
  This module will manage the operations related with digita once converted
  """

  @doc """
  Make checksum calculation

  ## Examples

      iex> BankOcr.Digits.Digit.checksum("457508000")
      {457508000, "OK"} | {457508000, "ERR"}

  """
  @spec checksum(String.t()) :: String.t()
  def checksum(account) do
    account_reversed = account |> String.reverse() |> String.graphemes()
    account_digits_parsed = Enum.map(account_reversed, fn x -> String.to_integer(x) end)

    {multiply_account, _acc} =
      Enum.map_reduce(account_digits_parsed, 1, fn x, acc -> {x * acc, acc + 1} end)

    checksum = Enum.reduce(multiply_account, 0, fn x, acc -> x + acc end)

    module_eleven = Integer.mod(checksum, 11)

    checksum_result =
      case module_eleven do
        0 -> "OK"
        _ -> "ERR"
      end

    checksum_result
  end

  @doc """
  Make account validation validation

  ## Examples

      iex> BankOcr.Digits.Digit.validate_account("457508000")
      true | false

  """
  @spec validate_account(String.t()) :: Bool.t()
  def validate_account(account) do
    String.contains?(account, "?")
  end

  @doc """
  Process account to be validated and evaluated

  ## Examples

      iex> BankOcr.Digits.Digit.process_account("457508000")
      "457508000 OK"

      iex> BankOcr.Digits.Digit.process_account("664371495")
      "664371495 ERR"

      iex> BankOcr.Digits.Digit.process_account("86110??36")
      "86110??36 ILL"

  """
  @spec process_account(String.t()) :: String.t()
  def process_account(account) do
    case validate_account(account) do
      true ->
        "#{account} ILL"

      false ->
        checksum_result = checksum(account)
        "#{account} #{checksum_result}"
    end
  end

  @doc """
  Process account to be validated and evaluated in bulk

  ## Examples

      iex> BankOcr.Digits.Digit.process_account_bulk(["457508000", "664371495", "86110??36"])
      ["457508000 OK", "664371495 ERR", "86110??36 ILL"]

  """
  @spec process_account_bulk([String.t()]) :: [String.t()]
  def process_account_bulk(accounts) do
    accounts
    |> Enum.map(fn account -> process_account(account) end)
  end
end
