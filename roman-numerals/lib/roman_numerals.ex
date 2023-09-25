defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: do_numeral(number, [])

  defp do_numeral(0, acc), do: acc |> Enum.reverse() |> Enum.join()

  defp do_numeral(n, acc) when n >= 1000, do: do_numeral(n - 1000, ["M" | acc])
  defp do_numeral(n, acc) when n >= 900, do: do_numeral(n - 900, ["CM" | acc])
  defp do_numeral(n, acc) when n >= 500, do: do_numeral(n - 500, ["D" | acc])
  defp do_numeral(n, acc) when n >= 400, do: do_numeral(n - 400, ["CD" | acc])
  defp do_numeral(n, acc) when n >= 100, do: do_numeral(n - 100, ["C" | acc])
  defp do_numeral(n, acc) when n >= 90, do: do_numeral(n - 90, ["XC" | acc])
  defp do_numeral(n, acc) when n >= 50, do: do_numeral(n - 50, ["L" | acc])
  defp do_numeral(n, acc) when n >= 40, do: do_numeral(n - 40, ["XL" | acc])
  defp do_numeral(n, acc) when n >= 10, do: do_numeral(n - 10, ["X" | acc])
  defp do_numeral(n, acc) when n >= 9, do: do_numeral(n - 9, ["IX" | acc])
  defp do_numeral(n, acc) when n >= 5, do: do_numeral(n - 5, ["V" | acc])
  defp do_numeral(n, acc) when n >= 4, do: do_numeral(n - 4, ["IV" | acc])
  defp do_numeral(n, acc) when n >= 1, do: do_numeral(n - 1, ["I" | acc])
end
