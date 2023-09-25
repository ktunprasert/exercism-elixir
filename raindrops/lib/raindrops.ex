defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    case pling(number) <> plang(number) <> plong(number) do
      "" -> Integer.to_string(number)
      result -> result
    end
  end

  defp pling(x) when rem(x, 3) == 0, do: "Pling"
  defp pling(_), do: ""

  defp plang(x) when rem(x, 5) == 0, do: "Plang"
  defp plang(_), do: ""

  defp plong(x) when rem(x, 7) == 0, do: "Plong"
  defp plong(_), do: ""
end
