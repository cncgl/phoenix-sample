defmodule HelloPhoenix.Api.TodoController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Todo

  plug :scrub_params, "todo" when action in [:create, :update]

  def index(conn, _params) do
    query = from w in Todo, order_by: [asc: :id]
    todos = query
        |> Repo.all(Todo)
    json conn, %{todos: todos}
  end

  # def new(conn, _params) do
  #   changeset = Todo.changeset(%Todo{})
  #   json conn, %{changeset: changeset}
  # end

  def create(conn, %{"todo" => todo_params}) do
    changeset = Todo.changeset(%Todo{}, todo_params)

    case Repo.insert(changeset) do
     {:ok, _todo} ->
        json conn, %{info: _todo.id}
     {:error, changeset} ->
       json conn, %{error: "error"}
   end
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    json conn, %{todo: todo}
  end

  # def edit(conn, %{"id" => id}) do
  #   todo = Repo.get!(Todo, id)
  #   changeset = Todo.changeset(todo)
  #   json conn, %{todo: todo, changeset: changeset}
  # end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo, todo_params)

    case Repo.update(changeset) do
      {:ok, todo} ->
        json conn, %{info: "ok"}
      {:error, changeset} ->
        json conn, %{error: "error"}
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(todo)

    json conn, %{info: "ok"}
  end
 end