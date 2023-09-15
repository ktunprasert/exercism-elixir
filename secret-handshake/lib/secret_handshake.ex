defmodule SecretHandshake do
  import Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @instructions ["wink", "double blink", "close your eyes", "jump"]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code)

  def commands(code) do
    instructions =
      do_commands(code, length(@instructions))
      |> Enum.zip(@instructions)
      |> Enum.reduce(
        [],
        fn
          {1, i}, acc -> [i | acc]
          _, acc -> acc
        end
      )

    (band(code, 16) == 0 && Enum.reverse(instructions)) || instructions
  end

  defp do_commands(0, depth) when depth <= 0, do: []
  defp do_commands(_code, 0), do: []

  defp do_commands(code, depth), do: [band(code, 1) | do_commands(code >>> 1, depth - 1)]
end
