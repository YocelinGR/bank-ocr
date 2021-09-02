defmodule BankOcr.Files.FileManager do
  @moduledoc """
  This module will manage the operations related to manipulate files like: read, write, manage its content, etc
  """
  @doc """
  Read File

  ## Examples

      iex> BankOcr.Files.FileManager.readFile("input_file.txt")
      {:ok, file_content} | {:err, "File does not have content"}

  """
  @spec readFile(String.t()) :: {:ok, String.t()} |{:err, String.t()}
  def readFile(file_name) do
    case File.read(file_name) do
      {:ok, contents} -> {:ok, contents}
      {:error, :enoent} -> {:err, "File does not have content"}
    end
  end
end
