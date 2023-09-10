defmodule HighScore do
  @score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @score), do: scores |> Map.put(name, score)

  def remove_player(scores, name), do: scores |> Map.delete(name)

  def reset_score(scores, name), do: scores |> Map.put(name, @score)

  def update_score(scores, name, score \\ @score),
    do: scores |> Map.update(name, score, &(&1 + score))

  def get_players(scores), do: scores |> Map.keys()
end
