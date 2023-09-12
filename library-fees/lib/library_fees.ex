defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    dt = checkout_datetime |> NaiveDateTime.to_date()

    cond do
      before_noon?(checkout_datetime) ->
        Date.add(dt, 28)

      true ->
        Date.add(dt, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime),
    do:
      actual_return_datetime
      |> then(&Date.diff(&1, planned_return_date))
      |> max(0)

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    planned_dt = checkout |> datetime_from_string |> return_date
    return_dt = datetime_from_string(return)

    if monday?(return_dt) do
      0.5
    else
      1
    end
    |> then(&(rate * days_late(planned_dt, return_dt) * &1))
    |> trunc
  end
end
