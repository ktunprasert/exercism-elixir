defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second <!-- list
   -->and if not whether it is equal or unequal to the second list.
  """
  def compare(same, same), do: :equal

  def compare(a, b) do
    cond do
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(a, b) when length(a) < length(b), do: false

  defp contains?([_ | tail] = lst, b) do
    sub_c = Enum.take(lst, length(b))
    sub_c === b or contains?(tail, b)
  end
end
