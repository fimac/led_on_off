defmodule UiWeb.LedController do
  use UiWeb, :controller

  def show(conn, _params) do
    live_render(conn, UiWeb.LedView)
  end
end
