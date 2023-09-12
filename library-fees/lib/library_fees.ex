defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601(string)
    |> elem(1)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    dt = checkout_datetime |> NaiveDateTime.to_date()

    cond do
      before_noon?(checkout_datetime) ->
        Date.add(dt, 28)

      true ->
        Date.add(dt, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> then(&Date.diff(&1, planned_return_date))
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> then(&(Date.day_of_week(&1) == 1))
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_dt = checkout |> datetime_from_string |> return_date
    return_dt = datetime_from_string(return)

    days_late(planned_dt, return_dt)
    |> then(fn
      multiplier ->
        cond do
          monday?(return_dt) -> rate * multiplier * 0.5
          true -> rate * multiplier
        end
    end)
    |> trunc()
  end
end
