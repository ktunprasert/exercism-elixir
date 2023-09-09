defmodule KitchenCalculator do
  @ml %{
    :cup => 240.0,
    :fluid_ounce => 30.0,
    :teaspoon => 5.0,
    :tablespoon => 15.0,
    :milliliter => 1.0
  }

  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, volume * @ml[unit]}

  def from_milliliter({_, volume}, unit), do: {unit, volume / @ml[unit]}

  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
