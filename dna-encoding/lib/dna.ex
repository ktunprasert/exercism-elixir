defmodule DNA do
  @acid %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @decode Map.new(@acid, fn {k, v} -> {v, k} end)

  def encode_nucleotide(code_point), do: @acid[code_point]

  def decode_nucleotide(encoded_code), do: @decode[encoded_code]

  def encode(dna) do
    encode(dna, <<>>)
  end

  def encode([], acc), do: acc

  def encode([code | rest], acc),
    do: encode(rest, <<acc::bitstring, encode_nucleotide(code)::4>>)

  def decode(dna) do
    decode(dna, [])
  end

  def decode(<<>>, acc), do: acc

  def decode(<<first::4, rest::bitstring>>, acc),
    do: decode(rest, acc ++ [decode_nucleotide(first)])
end
