defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_binary(path) do
    Enum.reduce(String.split(path, "."), data, & &2[&1])
  end

  def get_in_path(data, path) do
    path
    |> String.split(".")
    |> then(&Kernel.get_in(data, &1))
  end
end
