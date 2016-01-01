defmodule HelloPhoenix.Api.PageController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Page

  def index(conn, _params) do
    json conn, %{message: "this is root node"}
  end
end
