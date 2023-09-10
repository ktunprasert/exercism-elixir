defmodule BirdCount do
  def today([head | _]), do: head
  def today([]), do: nil

  def increment_day_count([head]), do: [head + 1]
  def increment_day_count([head | rest]), do: [head + 1 | rest]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | list]), do: has_day_without_birds?(list)
  def has_day_without_birds?([]), do: false

  def total([head | list]), do: head + total(list)
  def total([]), do: 0

  def busy_days([head | list]) when head >= 5, do: 1 + busy_days(list)
  def busy_days([_ | list]), do: busy_days(list)
  def busy_days([]), do: 0
end
