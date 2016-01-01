defmodule HelloPhoenix.Router do
  defmodule NoRouteError do
    @moduledoc """
    Exception raised when no route is found.
    """
    defexception plug_status: 404, message: "no route found", conn: nil, router: nil

    def exception(opts) do
      conn   = Keyword.fetch!(opts, :conn)
      router = Keyword.fetch!(opts, :rouetr)
      path   = "/" <> Enum.join(conn.path_info, "/")

      %NoRouteError{message: "no route found for #{conn.method} #{path} (#{inspect router})",
      conn: conn, router: router}
    end
  end

  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", HelloPhoenix do
  #  pipe_through :browser # Use the default browser stack

  #  get "/", PageController, :index
  #  get "/hello", HelloController, :index
  #  get "/hello/:messenger", HelloController, :show

  #  resources "todos", TodoController

    # Routing Sample
    # resources "/users", UserController do
    #    resources "posts", PostController
    # end
  #  resources "posts", PostController, only: [:index, :show]
  #  resources "comments", CommentController, except: [:delete]
  #  resources "/reviews", ReviewController
  # end
  scope "/", HelloPhoenix do
    pipe_through :api

    resources "/", Api.PageController, only: [:index]
  end

  # Routing - Second Routes
  scope "/admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloPhoenix do
    pipe_through :api

    resources "todos", Api.TodoController
    # resources "reviews", ReviewController
    # resources "contacts", ContactController
  end
end
