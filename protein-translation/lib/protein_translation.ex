defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) when rem(length(rna), 3) != 0 do
    {:error, "Invalid RNA"}
  end

  def of_rna(rna) do
    rna
    |> String.to_charlist()
    |> Enum.chunk_every(3)
    |> Enum.reduce_while(
      {:ok, []},
      fn x, {stat, acc} ->
        case x |> List.to_string() |> of_codon() do
          {:ok, "STOP"} ->
            {:halt, {stat, acc}}

          {:ok, protein} ->
            {:cont, {stat, acc ++ [protein]}}

          {:error, _} ->
            {:halt, {:error, "invalid RNA"}}
        end
      end
    )
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    cond do
      codon in ["UAA", "UAG", "UGA"] -> {:ok, "STOP"}
      codon in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      codon in ["UUA", "UUG"] -> {:ok, "Leucine"}
      codon in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      codon in ["UCU", "UCC", "UCA", "UCG"] -> {:ok, "Serine"}
      codon in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      codon == "AUG" -> {:ok, "Methionine"}
      codon == "UGG" -> {:ok, "Tryptophan"}
      true -> {:error, "invalid codon"}
    end
  end
end
