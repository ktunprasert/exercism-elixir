defmodule Rules do
  @spec eat_ghost?(boolean, boolean) :: boolean
  def eat_ghost?(true, true), do: true
  def eat_ghost?(_, _), do: false

  @spec score?(boolean, boolean) :: boolean
  def score?(true, _), do: true
  def score?(_, true), do: true
  def score?(_, _), do: false

  @spec lose?(boolean, boolean) :: boolean
  def lose?(false, true), do: true
  def lose?(_, _), do: false

  @spec win?(boolean, boolean, boolean) :: boolean
  def win?(true, pellet?, touching?), do: not lose?(pellet?, touching?)
  def win?(false, _, _), do: false
end
