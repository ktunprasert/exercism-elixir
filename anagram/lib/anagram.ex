defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    with base <- base |> normalise do
      candidates
      |> Enum.filter(&anagram?(&1 |> normalise, base))
    end
  end

  def anagram?(base, base), do: false

  def anagram?(cand, base),
    do:
      base |> String.to_charlist() |> Enum.sort() ==
        cand |> String.to_charlist() |> Enum.sort()

  def normalise(s), do: s |> String.downcase()
end
