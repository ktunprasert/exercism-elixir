defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found

  def search(numbers, key) do
    if key < elem(numbers, 0) or key > elem(numbers, tuple_size(numbers) - 1), do: :not_found

    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(_, _, low, high) when low > high, do: :not_found

  defp search(numbers, key, low, high) do
    mid = div(low + high, 2)

    case elem(numbers, mid) do
      ^key -> {:ok, mid}
      v when v < key -> search(numbers, key, mid + 1, high)
      v when v > key -> search(numbers, key, low, mid - 1)
    end
  end
end
