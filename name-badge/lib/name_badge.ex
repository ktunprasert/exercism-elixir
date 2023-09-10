defmodule NameBadge do
  def print(id, name, department) do
    id = if id, do: "[#{id}]"
    department = if department, do: department |> String.upcase(), else: "OWNER"

    [id, name, department] |> Enum.filter(& &1) |> Enum.join(" - ")
  end
end
