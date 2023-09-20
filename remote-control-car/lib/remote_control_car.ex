defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]

  def new() do
    %RemoteControlCar{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: "none"
    }
  end

  def new(nickname) do
    %{new() | nickname: nickname}
  end

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar) do
    remote_car
    |> Map.get(:distance_driven_in_meters)
    |> then(&"#{&1} meters")
  end

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    remote_car
    |> Map.get(:battery_percentage)
    |> then(fn
      0 -> "Battery empty"
      p -> "Battery at #{p}%"
    end)
  end

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar) do
    do_drive(remote_car)
  end

  defp do_drive(%{battery_percentage: 0} = car), do: car

  defp do_drive(%{distance_driven_in_meters: dist, battery_percentage: battery} = car) do
    %{car | distance_driven_in_meters: dist + 20, battery_percentage: battery - 1}
  end
end
