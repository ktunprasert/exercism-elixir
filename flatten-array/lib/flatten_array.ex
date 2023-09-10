defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten(head) when not is_list(head), do: [head]
  def flatten([nil | rest]), do: flatten(rest)
  def flatten([head | rest]), do: flatten(head) ++ flatten(rest)
end
