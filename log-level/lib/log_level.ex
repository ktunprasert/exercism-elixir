defmodule LogLevel do
  @labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @legacy [0, 5]

  def to_label(level, legacy?) do
    cond do
      level in @legacy && !legacy? -> @labels[level]
      level > 0 && level < 5 -> @labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown && legacy? -> :dev1
      label == :unknown && !legacy? -> :dev2
      true -> false
    end
  end
end
