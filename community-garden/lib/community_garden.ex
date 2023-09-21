# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> {[], 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, &(&1 |> elem(0)))
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {registrations, next_id} ->
      plot = %Plot{plot_id: next_id, registered_to: register_to}
      state = {registrations ++ [plot], next_id + 1}
      {plot, state}
    end)
  end

  def release(pid, plot_id) do
    Agent.cast(pid, fn {registrations, next_id} ->
      {Enum.reject(registrations, fn plot -> plot.plot_id == plot_id end), next_id}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {registrations, _} ->
      Enum.find(registrations, fn plot -> plot.plot_id == plot_id end) ||
        {:not_found, "plot is unregistered"}
    end)
  end
end
