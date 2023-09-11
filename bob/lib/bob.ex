defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input
    |> String.trim()
    |> then(fn
      "" ->
        "Fine. Be that way!"

      input ->
        case {String.match?(input, ~r/\?$/), yelling?(input)} do
          {true, false} -> "Sure."
          {false, true} -> "Whoa, chill out!"
          {true, true} -> "Calm down, I know what I'm doing!"
          _ -> "Whatever."
        end
    end)
  end

  defp yelling?(input), do: String.match?(input, ~r/\p{L}+/u) and input == String.upcase(input)
end
