defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> to_charlist
    |> Enum.reduce(
      0,
      fn
        char, acc when char in ~c(aeioulnrst) -> 1 + acc
        char, acc when char in ~c(dg) -> 2 + acc
        char, acc when char in ~c(bcmp) -> 3 + acc
        char, acc when char in ~c(fhvwy) -> 4 + acc
        ?k, acc -> 5 + acc
        char, acc when char in ~c(jx) -> 8 + acc
        char, acc when char in ~c(qz) -> 10 + acc
        _char, acc -> acc
      end
    )
  end
end
