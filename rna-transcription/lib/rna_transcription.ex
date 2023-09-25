defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: to_rna(dna, [])

  def to_rna([], acc), do: acc |> Enum.reverse()
  def to_rna([head | rest], acc), do: to_rna(rest, [transcribe(head) | acc])

  defp transcribe(?G), do: ?C
  defp transcribe(?C), do: ?G
  defp transcribe(?T), do: ?A
  defp transcribe(?A), do: ?U
end
