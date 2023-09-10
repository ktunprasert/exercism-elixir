defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second <!-- list
   -->and if not whether it is equal or unequal to the second list.
  """
  def compare(same, same), do: :equal

  def compare(a, b) do
    cond do
      subset?(a, b) -> :sublist
      subset?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp subset?(_a, []), do: false

  defp subset?(a, b) do
    if List.starts_with?(b, a), do: true, else: subset?(a, tl(b))
  end
end
