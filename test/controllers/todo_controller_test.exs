defmodule HelloPhoenix.TodoControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Todo
  @valid_attrs %{status: true, title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, todo_path(conn, :index)
    # assert json_response(conn, 200) =~ "Listing todos"
    json = assert json_response(conn, 200)
    # assert json["id"] == 1
  end

  # test "renders form for new resources", %{conn: conn} do
  #  conn = get conn, todo_path(conn, :new)
  #  assert json_response(conn, 200) =~ "New todo"
  # end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, todo_path(conn, :create), todo: @valid_attrs
    # assert redirected_to(conn) == todo_path(conn, :index)
    assert Repo.get_by(Todo, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, todo_path(conn, :create), todo: @invalid_attrs
    # assert json_response(conn, 200) =~ "New todo"
    body = json_response(conn, 200)
    # IO.puts body["title"]
  end

  test "shows chosen resource", %{conn: conn} do
    todo = Repo.insert! %Todo{}
    conn = get conn, todo_path(conn, :show, todo)
    # assert json_response(conn, 200) =~ "Show todo"
    body = json_response(conn, 200)
    IO.puts body["id"]
    # assert body["id"] == 103
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, todo_path(conn, :show, -1)
    end
  end

  # test "renders form for editing chosen resource", %{conn: conn} do
  #   todo = Repo.insert! %Todo{}
  #   conn = get conn, todo_path(conn, :edit, todo)
  #   assert json_response(conn, 200) =~ "Edit todo"
  # end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    todo = Repo.insert! %Todo{}
    conn = put conn, todo_path(conn, :update, todo), todo: @valid_attrs
    # assert redirected_to(conn) == todo_path(conn, :show, todo)
    assert Repo.get_by(Todo, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    todo = Repo.insert! %Todo{}
    conn = put conn, todo_path(conn, :update, todo), todo: @invalid_attrs
    # assert json_response(conn, 200) =~ "Edit todo"
    body = json_response(conn, 200)
    # assert body["id"] == 103
  end

  test "deletes chosen resource", %{conn: conn} do
    todo = Repo.insert! %Todo{}
    conn = delete conn, todo_path(conn, :delete, todo)
    # assert redirected_to(conn) == todo_path(conn, :index)
    refute Repo.get(Todo, todo.id)
  end
end
