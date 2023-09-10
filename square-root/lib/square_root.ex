defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    heron_sqrt(radicand, radicand / 2)
  end

  defp heron_sqrt(number, estimate) when number == estimate * estimate, do: estimate |> trunc

  defp heron_sqrt(number, estimate) do
    guess = (estimate + number / estimate) / 2

    heron_sqrt(number, guess)
  end
end
