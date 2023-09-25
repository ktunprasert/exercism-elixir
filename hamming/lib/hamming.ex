defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(s1, s2) when length(s1) != length(s2),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2) do
    strand1
    |> Enum.zip(strand2)
    |> Enum.reduce(0, fn
      {a, a}, acc -> acc
      {_a, _b}, acc -> acc + 1
    end)
    |> then(&{:ok, &1})
  end
end
