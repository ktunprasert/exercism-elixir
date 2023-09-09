defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    case is_list(language) do
      true -> list ++ language
      _ -> [language] ++ list
    end
  end

  def remove(list) do
    [_ | tail] = list
    tail
  end

  def first(list) do
    case length(list) do
      0 -> ""
      _ -> List.first(list)
    end
  end

  def count(list) do
    List.foldl(list, 0, fn _, acc -> acc + 1 end)
  end

  def functional_list?(list) do
    List.foldl(list, false, fn lang, acc -> acc || lang == "Elixir" end)
  end
end
