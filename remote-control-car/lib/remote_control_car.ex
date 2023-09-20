defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{
      nickname: nickname
    }
  end

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar) do
    remote_car.distance_driven_in_meters
    |> then(&"#{&1} meters")
  end

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    remote_car.battery_percentage
    |> then(fn
      0 -> "Battery empty"
      p -> "Battery at #{p}%"
    end)
  end

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar) do
    case remote_car.battery_percentage do
      0 ->
        remote_car

      battery ->
        %{
          remote_car
          | battery_percentage: battery - 1,
            distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
        }
    end
  end
end
