defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second <!-- list
   -->and if not whether it is equal or unequal to the second list.
  """
  def compare(same, same), do: :equal

  def compare(a, b), do: compare(a, b, length(a), length(b))

  def compare([], [], _, _), do: :equal
  def compare([], _, _, _), do: :sublist
  def compare(_, [], _, _), do: :superlist

  def compare(same, same, a, b) do
    cond do
      a > b -> :superlist
      a < b -> :sublist
      true -> :unequal
    end
  end

  def compare([a], [b], pa, pb) do
    cond do
      pa > pb && a < b -> :superlist
      pa < pb && a > b -> :sublist
      true -> :unequal
    end
  end

  def compare([a | as] = al, [b | bs] = bl, pa, pb) do
    # if a == b do
    #   compare(as, bs, pa, pb)
    # else
    IO.inspect(al, label: "al")
    IO.inspect(bl, label: "bl")

    cond do
      a == b ->
        compare(as, bs, pa, pb)

      pa > pb ->
        IO.puts("fst")
        compare(as, bl, pa, pb)

      pb > pa ->
        IO.puts("snd")
        compare(al, bs, pa, pb)

      true ->
        :unequal
    end

    # end
  end
end
