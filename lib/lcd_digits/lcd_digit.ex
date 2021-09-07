defmodule BankOcr.LcdDigits.LcdDigit do
  @moduledoc """
  This module will manage the operations related with convert the lcd digits into integer characters
  """
  alias BankOcr.Utils.Util
  require Logger

  @lcd_digits_str "
 _  _  _  _  _  _  _  _  _                             _  _  _  _  _  _  _  _  _
| || || || || || || || || |  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
|_||_||_||_||_||_||_||_||_|  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
                                                       _  _  _  _  _  _  _  _  _
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
 _| _| _| _| _| _| _| _| _| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_

_  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
_| _| _| _| _| _| _| _| _| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
_| _| _| _| _| _| _| _| _| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
                                                      _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
  |  |  |  |  |  |  |  |  | |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_

 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
|_||_||_||_||_||_||_||_||_| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
  |  |  |  |  |  |  |  |  | |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
  |  |  |  |  |  |  |  |  | |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
|_||_||_||_||_||_||_||_||_| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_

 _  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
  _  _     _  _  _  _  _                            _  _  _  _  _  _  _  _  _
| _| _||_||_ |_   ||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
||_  _|  | _||_|  ||_| _| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
 _  _  _  _  _  _  _  _                               _  _  _  _  _  _  _  _  _
| || || || || || || ||_   | |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
|_||_||_||_||_||_||_| _|  | |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_

    _  _  _  _  _  _     _                            _  _  _  _  _  _  _  _  _
|_||_|| || ||_   |  |  | _  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
  | _||_||_||_|  |  |  | _| |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
| _| _||_| _ |_   ||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
||_  _|  | _||_|  ||_| _  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
  _  _  _  _  _  _  _  _                            _  _  _  _  _  _  _  _  _
| _| _||_| _ |_   ||_||_| |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|
||_  _|  | _||_|  ||_| _  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_
"


  @doc """
  Convert multiline str into lists

  ## Examples

      iex> BankOcr.LcdDigits.LcdDigit.multiline_str_to_list()
      [" _  _  _  _  _  _  _  _  _                             _  _  _  _  _  _  _  _  _", .. "||_  _|  | _||_|  ||_| _  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_"]

  """
  @spec multiline_str_to_list(String.t()) :: [String.t()]
  def multiline_str_to_list(lcd_digits_str) do
    lcd_digits_str
    |> Util.string_to_list()
    |> Enum.filter(fn x -> x != "" end)
  end

  @doc """
  Convert a list of lcd number into a string representing a integer

  ## Examples

      iex> BankOcr.LcdDigits.LcdDigit.process_digit_list([
    " _ ",
    "| |",
    "|_|",
  ])
      "0"

  """
  @spec lcd_digit_to_integer([String.t]) :: String.t()
  def lcd_digit_to_integer([
    " _ ",
    "| |",
    "|_|",
  ]), do: "0"
  def lcd_digit_to_integer([
    "   ",
    "  |",
    "  |",
  ]), do: "1"
  def lcd_digit_to_integer([
    " _ ",
    " _|",
    "|_ ",
  ]), do: "2"
  def lcd_digit_to_integer([
    " _ ",
    " _|",
    " _|",
  ]), do: "3"
  def lcd_digit_to_integer([
    "   ",
    "|_|",
    "  |",
  ]), do: "4"
  def lcd_digit_to_integer([
    " _ ",
    "|_ ",
    " _|",
  ]), do: "5"
  def lcd_digit_to_integer([
    " _ ",
    "|_ ",
    "|_|",
  ]), do: "6"
  def lcd_digit_to_integer([
    " _ ",
    "  |",
    "  |",
  ]), do: "7"
  def lcd_digit_to_integer([
    " _ ",
    "|_|",
    "|_|",
  ]), do: "8"
  def lcd_digit_to_integer([
    " _ ",
    "|_|",
    " _|",
  ]), do: "9"

  def lcd_digit_to_integer(_), do: "?"

  @doc """
  Convert a list of lcd digit on a str containing the list integer numbers
  Receives a list with three elements

  ## Examples

      iex> BankOcr.LcdDigits.LcdDigit.process_digit_list([" _  _  _  _  _  _  _  _  _                             _  _  _  _  _  _  _  _  _ ", "| || || || || || || || || |  |  |  |  |  |  |  |  |  | _| _| _| _| _| _| _| _| _|", "|_||_||_||_||_||_||_||_||_|  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_ "])
      "45750800066437149586110??36"

  """
  @spec process_digit_list([String.t()]) :: String.t()
  def process_digit_list(digit_rows) do
    chunky_list = digit_rows
    |> Enum.map(fn x ->
      x
      |> String.graphemes()
      |> Enum.chunk_every(3)
    end)

    first_list = Enum.at(chunky_list, 0)
    second_list = Enum.at(chunky_list, 1)
    third_list = Enum.at(chunky_list, 2)

    matrix_length = length(first_list)-1

    matrix_list = for n <- 0..matrix_length do
      first_row = Enum.at(first_list, n) |> List.to_string()
      second_row = Enum.at(second_list, n) |> List.to_string()
      third_row = Enum.at(third_list, n) |> List.to_string()

      [first_row, second_row, third_row]
    end

    matrix_list
    |> Enum.map(fn digit ->
      lcd_digit_to_integer(digit)
    end)
    |> List.to_string()
  end

  @doc """
  Convert multiline str into lists

  ## Examples

      iex> BankOcr.LcdDigits.LcdDigit.process_lcd_file()
      [" _  _  _  _  _  _  _  _  _                             _  _  _  _  _  _  _  _  _", .. "||_  _|  | _||_|  ||_| _  |  |  |  |  |  |  |  |  ||_ |_ |_ |_ |_ |_ |_ |_ |_"]

  """
  @spec process_lcd_file(String.t()) :: String.t()
  def process_lcd_file(lcd_digits_str) do
    multiline_str_to_list(lcd_digits_str)
    |> Enum.chunk_every(3)
    |> Enum.map(fn digits ->
      process_digit_list(digits)
    end)
    |> Enum.reduce("", fn x, acc -> "#{acc}\n#{x}" end)
  end
end
