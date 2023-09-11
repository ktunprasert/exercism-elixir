defmodule BasketballWebsite do
  def extract_from_path(data, []), do: data

  def extract_from_path(data, [head | rest]) do
    if data[head] != nil do
      %{
        ^head => nested_data
      } = data

      extract_from_path(nested_data, rest)
    else
      nil
    end
  end

  def extract_from_path(data, path) when is_binary(path) do
    extract_from_path(data, String.split(path, "."))
  end

  def get_in_path(data, path) do
    path
    |> String.split(".")
    |> then(&Kernel.get_in(data, &1))
  end
end
