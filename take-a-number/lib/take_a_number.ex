defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(x) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, x) |> loop

      {:take_a_number, sender_pid} ->
        send(sender_pid, x + 1) |> loop

      :stop ->
        :ok

      _ ->
        loop(x)
    end
  end
end
