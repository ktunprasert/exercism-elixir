defmodule Username do
  def sanitize(username) do
    username
    |> List.foldl(
      [],
      fn r, acc ->
        case r do
          ?ä ->
            acc ++ ~c"ae"

          ?ö ->
            acc ++ ~c"oe"

          ?ü ->
            acc ++ ~c"ue"

          ?ß ->
            acc ++ ~c"ss"

          r ->
            if valid?(r) do
              acc ++ [r]
            else
              acc
            end
        end
      end
    )
  end

  defp valid?(char) do
    char == ?_ || (char >= ?a && char <= ?z)
  end
end
