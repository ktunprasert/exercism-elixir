defmodule Username do
  def sanitize([]), do: []

  def sanitize([char | rest]) do
    case char do
      char when char in ?a..?z -> [char]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      ?_ -> ~c"_"
      _ -> ~c""
    end
    |> Kernel.++(sanitize(rest))
  end
end
