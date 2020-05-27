defmodule DemoWeb.CounterLive do
  use DemoWeb, :live_view

  @impl true
  def render(assigns) do
    ~L"""
    Current count: <%= @count %>
    <br>
    <button phx-click="dec">-</button>
    <br>
    <button phx-click="inc">+</button>
    """
  end

  @impl true
  def mount(%{count: initial} , _session, socket) do
    {:ok, assign(socket, count: initial)}
  end

  @impl true
  def mount(_param, _session, socket) do
    {:ok, assign(socket, count: 100)}
  end

  @impl true
  def handle_event("dec", _value, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  @impl true
  def handle_event("inc", _value, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end
end