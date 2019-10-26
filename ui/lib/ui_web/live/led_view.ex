defmodule UiWeb.LedView do
  use Phoenix.LiveView

  alias Circuits.GPIO

  require Logger

  def render(assigns) do
    ~L"""
    <section class="phx-hero">
        <h1>Led goes on, Led goes off</h1>
    </section>

    <section class="row">
        <div class="column red-led">
            <h1>Red Led</h1>
              <button phx-click="red-on">On</button>
              <button phx-click="red-off">Off</button>
        </div>
        <div class="column green-led">
            <h1>Green Led</h1>
                <button phx-click="green-on">On</button>
                <button phx-click="green-off">Off</button>
        </div>
    </section>
    """
  end

  def mount(_session, socket) do
    {:ok, red_led} = GPIO.open(26, :output)
    {:ok, green_led} = GPIO.open(16, :output)

    {:ok, assign(socket, red_led: red_led, green_led: green_led)}
  end

  def handle_event("red-on", _, %{assigns: %{red_led: red_led}} = socket) do
    GPIO.write(red_led, 1)
    {:noreply, socket}
  end

  def handle_event("red-off", _, %{assigns: %{red_led: red_led}} = socket) do
    GPIO.write(red_led, 0)
    {:noreply, socket}
  end

  def handle_event("green-on", _, %{assigns: %{green_led: green_led}} = socket) do
    GPIO.write(green_led, 1)
    {:noreply, socket}
  end

  def handle_event("green-off", _, %{assigns: %{green_led: green_led}} = socket) do
    GPIO.write(green_led, 0)
    {:noreply, socket}
  end
end
