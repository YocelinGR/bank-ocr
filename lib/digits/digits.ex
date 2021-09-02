defmodule BankOcr.Digits.Digit do
@moduledoc """
  This module will manage the operations related with digita once converted
  """
  require Logger

  @doc """
  Make checksum calculation

  ## Examples

      iex> BankOcr.Digits.Digit.checksum("457508000")
      {457508000, "OK"} | {457508000, "ERR"}

  """
  @spec checksum(String.t()) :: {String.t(), String.t()}
  def checksum(account) do
    account_reversed = account |> String.reverse() |> String.graphemes()
    account_digits_parsed = Enum.map(account_reversed, fn x -> String.to_integer(x) end)


    {multiply_account, _acc} = Enum.map_reduce(account_digits_parsed, 1, fn x, acc -> {x * acc, acc + 1} end)

    checksum = Enum.reduce(multiply_account, 0, fn x, acc -> x + acc end)

    module_eleven = Integer.mod(checksum, 11)

    checksum_result = case module_eleven do
      0 -> "OK"
      _ -> "ERR"
    end
    {account, checksum_result}
  end

  @doc """
  Make account validation validation

  ## Examples

      iex> BankOcr.Digits.Digit.validate_Account("457508000")
      true | false

  """
  @spec validate_Account(String.t()) :: Bool.t()
  def validate_Account(account) do
    String.contains?(account, "?")
  end
end


# https://docs.google.com/document/d/1uEZlCL7gRcKRokHh-nPRtkPDeQxg20gG0SVLZHwpLxU/edit
