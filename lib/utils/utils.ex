defmodule BankOcr.Utils.Util do
@moduledoc """
    This module will provide functions that will be useful for all the modules
    """

  @doc """
  List of strings into string

  ## Examples

      iex> BankOcr.Utils.Util.list_to_string(["457508000 OK", "664371495 ERR", "86110??36 ILL"])
      "457508000 OK
      664371495 ERR
      86110??36 ILL"

  """
  @spec list_to_string([String.t()]) :: String.t()
  def list_to_string(accounts) do
    accounts
    |> Enum.join("\n")
  end

  @doc """
  String into list bein splited by line breake

  ## Examples

      iex> BankOcr.Utils.Util.string_to_list("457508000 OK\n664371495 ERR\n86110??36 ILL")
      ["457508000 OK", "664371495 ERR", "86110??36 ILL"]

  """
  @spec string_to_list(String.t()) :: [String.t()]
  def string_to_list(accounts) do
    accounts
    |> String.split("\n")
  end
end
# string  into list
# slice en segmentos de 9
# procesar list
# regresar list a string

# read file
# matrix
# write file
