defmodule LogParser do
  def valid_line?(line), do: line |> String.match?(~r/^\[(ERROR|DEBUG|INFO|WARNING)\]/)

  def split_line(line), do: line |> String.split(~r/<[=\*~-]*>/)

  def remove_artifacts(line), do: line |> String.replace(~r/end-of-line\d+/i, "")

  def tag_with_user_name(line),
    do:
      line
      |> then(&Regex.run(~r/User\s+(\S+)/u, &1))
      |> then(fn
        [_, user] -> "[USER] #{user} #{line}"
        nil -> line
      end)
end
