defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort(fn l, r ->
      if l.price == r.price, do: l.name > r.name, else: l.price < r.price
    end)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(&Map.put(&1, :name, String.replace(&1.name, old_word, new_word)))
  end

  def increase_quantity(item, count) do
    item.quantity_by_size
    |> Map.new(fn {key, val} -> {key, val + count} end)
    |> then(&%{item | quantity_by_size: &1})
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, &(elem(&1, 1) + &2))
  end
end
