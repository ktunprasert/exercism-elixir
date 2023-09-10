defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second <!-- list
   -->and if not whether it is equal or unequal to the second list.
  """
  def compare(same, same), do: :equal

  def compare(a, b) do
    cond do
      contains?(a, b) -> :sublist
      contains?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp contains?(_a, []), do: false

  defp contains?(a, b) do
    if List.starts_with?(b, a), do: true, else: contains?(a, tl(b))
  end
end
