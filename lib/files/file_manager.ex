defmodule BankOcr.Files.FileManager do
  @moduledoc """
  This module will manage the operations related to manipulate files like: read, write, manage its content, etc
  """

  @doc """
  Read File
  ## Examples

      iex> BankOcr.Files.FileManager.readFile("input_file.txt")
      {:ok, file_content} | {:err, "Couldn't find that file you were looking for"}

  """
  @spec readFile(String.t()) :: {:ok, String.t()} |{:err, String.t()}
  def readFile(file_name) do
    case File.read(file_name) do
      {:ok, contents} -> {:ok, contents}
      {:error, :enoent} -> {:err, "Couldn't find that file you were looking for"}
    end
  end

  @doc """
  Write File
  ## Examples

      iex> BankOcr.Files.FileManager.writeFile("file_processed.txt", "content")
      {:ok, "File writed"} | {:err, "Ops, something happend"}

  """
  @spec writeFile(String.t(), String.t()) :: {:ok, String.t()} |{:err, String.t()}
  def writeFile(file_name, content) do
    case File.write(file_name, content) do
      :ok -> {:ok, "File writed"}
      _ -> {:err, "Ops, something happend"}
    end
  end
end
