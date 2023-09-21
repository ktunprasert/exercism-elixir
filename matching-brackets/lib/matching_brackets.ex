defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    check(str, [])
  end

  defp check(<<?[, s::binary>>, stack) do
    check(s, [?] | stack])
  end

  defp check(<<?{, s::binary>>, stack) do
    check(s, [?} | stack])
  end

  defp check(<<?(, s::binary>>, stack) do
    check(s, [?) | stack])
  end

  defp check(<<?], s::binary>>, [?] | stack]) do
    check(s, stack)
  end

  defp check(<<?), s::binary>>, [?) | stack]) do
    check(s, stack)
  end

  defp check(<<?}, s::binary>>, [?} | stack]) do
    check(s, stack)
  end

  defp check(<<close, _s::binary>>, _stack) when close in [?}, ?), ?]] do
    false
  end

  defp check(<<_any, s::binary>>, stack) do
    check(s, stack)
  end

  defp check("", []), do: true
  defp check(_, _), do: false
end
