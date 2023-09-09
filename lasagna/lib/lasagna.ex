defmodule Lasagna do
  @spec expected_minutes_in_oven() :: integer
  def expected_minutes_in_oven, do: 40

  @spec remaining_minutes_in_oven(integer) :: integer
  def remaining_minutes_in_oven(time_taken), do: expected_minutes_in_oven() - time_taken

  @spec preparation_time_in_minutes(integer) :: integer
  def preparation_time_in_minutes(layer), do: layer * 2

  @spec total_time_in_minutes(integer, integer) :: integer
  def total_time_in_minutes(layer, time_taken),
    do: preparation_time_in_minutes(layer) + time_taken

  @spec alarm() :: String.t()
  def alarm, do: "Ding!"
end
