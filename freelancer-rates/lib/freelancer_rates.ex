defmodule FreelancerRates do
  @hours 8.0
  @days 22.0

  def daily_rate(hourly_rate) do
    @hours * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> Kernel.*(@days)
    |> apply_discount(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> then(&budget / &1)
    |> Float.floor(1)
  end
end
