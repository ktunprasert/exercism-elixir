defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    do_encode(string |> String.to_charlist(), [], nil, 1)
  end

  defp do_encode([], [], _cursor, _count), do: ""

  defp do_encode([], acc, cursor, count),
    do: [code(cursor, count) | acc] |> Enum.reverse() |> Enum.join()

  defp do_encode([head | rest], acc, nil, _count), do: do_encode(rest, acc, head, 1)
  defp do_encode([same | rest], acc, same, count), do: do_encode(rest, acc, same, count + 1)

  defp do_encode([new | rest], acc, prev, count),
    do: do_encode(rest, [code(prev, count) | acc], new, 1)

  defp code(char, 1), do: <<char>>
  defp code(char, count), do: <<"#{count}", char>>

  @decode_regex ~r/(\d*)([\w\s])/
  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.scan(@decode_regex, string)
    |> Enum.reduce("", fn
      [_, "", char], acc -> acc <> char
      [_, count, char], acc -> acc <> String.duplicate(char, String.to_integer(count))
    end)
  end
end
