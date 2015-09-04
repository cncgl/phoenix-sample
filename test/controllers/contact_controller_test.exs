defmodule HelloPhoenix.ContactControllerTest do
  # use ExUnit.Case, async: false
  # use Plug.Test
  alias HelloPhoenix.Contact
  alias HelloPhoenix.Repo
  # alias Ecto.Adapters.SQL
  use HelloPhoenix.ConnCase

  # setup do
  #  SQL.begin_test_transaction(Repo)
  #
  #  on_exit fn ->
  #    SQL.rollback_test_transaction(Repo)
  #  end
  # end

  test "/index returns a list of contacts" do
    # IO.puts "test"

    contacts_as_json =
      %Contact{name: "Gumbo", phone: "(801) 555-5555"}
    Repo.insert contacts_as_json
    Poison.encode! contacts_as_json

    #  |> Repo.insert
    #  |> List.wrap
    #  |> Poison.encode!
    # IO.puts Poison.encode!(%Contact{name: "Gumbo", phone: "(801) 555-5555"})
    # Poison.encode! contacts_as_json

    response = conn(:get, "/api/contacts")
      |> send_request

    assert response.status == 200
    assert response.resp_body == contacts_as_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> HelloPhoenix.Endpoint.call([])
  end
end

