defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc)

  def decode_secret_message_part({key, _, _} = ast, acc) when key not in [:def, :defp],
    do: {ast, acc}

  def decode_secret_message_part(ast, acc) when is_tuple(ast) do
    case ast do
      {key, _, [{:when, _, [{name, _, args} | _]} | _]} when key in [:def, :defp] ->
        {ast, do_part(name, args, acc)}

      {key, _, [{name, _, args} | _]} when key in [:def, :defp] ->
        {ast, do_part(name, args, acc)}

      _ ->
        {ast, acc}
    end
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp do_part(_name, nil, acc), do: ["" | acc]
  defp do_part(name, args, acc), do: [String.slice("#{name}", 0, length(args)) | acc]

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk(
      [],
      fn
        {key, _, _} = node, acc when key in [:def, :defp] -> {node, acc ++ [node]}
        node, acc -> {node, acc}
      end
    )
    |> elem(1)
    |> Enum.flat_map(&(decode_secret_message_part(&1, []) |> elem(1)))
    |> Enum.join()
  end
end
