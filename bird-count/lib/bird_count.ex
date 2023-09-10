defmodule BirdCount do
  def today([head | _]), do: head
  def today([]), do: nil

  def increment_day_count([head]), do: [head + 1]
  def increment_day_count([head | rest]), do: [head + 1 | rest]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?(list), do: list |> Enum.any?(&(&1 == 0))

  def total(list), do: list |> Enum.sum()

  def busy_days(list), do: list |> Enum.filter(&(&1 >= 5)) |> length
end
