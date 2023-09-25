defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      input_base < 2 ->
        {:error, "input base must be >= 2"}

      output_base < 2 ->
        {:error, "output base must be >= 2"}

      Enum.any?(digits, &(&1 < 0 || &1 >= input_base)) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        convert_from(digits, input_base, length(digits) - 1, 0)
        |> convert_to(output_base, [])
        |> then(&{:ok, &1})
    end
  end

  defp convert_from([], _base, _e, acc), do: acc

  defp convert_from([head | tail], base, e, acc) do
    convert_from(tail, base, e - 1, acc + head * base ** e)
  end

  defp convert_to(0, _base, []), do: [0]
  defp convert_to(0, _base, acc), do: acc

  defp convert_to(n, base, acc) do
    convert_to(div(n, base), base, [rem(n, base) | acc])
  end
end
