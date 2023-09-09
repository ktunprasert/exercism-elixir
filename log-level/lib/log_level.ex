defmodule LogLevel do
  def to_label(0, false), do: :trace
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) in [:error, :fatal] ->
        :ops

      to_label(level, legacy?) == :unknown ->
        cond do
          legacy? -> :dev1
          true -> :dev2
        end

      true ->
        false
    end
  end
end
