defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(_bread, %{health: hp} = char) do
      {nil, %{char | health: hp + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(potion, %{mana: mp} = char) do
      {%EmptyBottle{}, %{char | mana: mp + potion.strength}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_poison, char) do
      {%EmptyBottle{}, %{char | health: 0}}
    end
  end
end
