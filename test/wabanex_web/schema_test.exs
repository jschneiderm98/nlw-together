defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.User.Create

  describe "users queries" do
    test "in: valid id -> user", %{conn: conn} do
      test_user = %{email: "julio@email.com", name: "Julio", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(test_user)

      query = """
        {
          getUser(id: "#{user_id}"){
            id
            name
            email
          }
        }
      """

      expected = %{
        "data" => %{
          "getUser" => %{
            "email" => "julio@email.com",
            "id" => user_id,
            "name" => "Julio"
          }
        }
      }

      actual =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert actual == expected
    end
  end

  describe "users mutations" do
    test "in: valid params -> creates user", %{conn: conn} do
      test_user = %{email: "julio@email.com", name: "Julio", password: "123456"}

      {:ok, %_User{}} = Create.call(test_user)

      mutation = """
        mutation {
          createUser(input: {name: "Joao", email: "joao@email.com", password: "123456"}){
            name
            email
          }
        }
      """

      expected = %{"data" => %{"createUser" => %{"email" => "joao@email.com", "name" => "Joao"}}}

      actual =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert actual == expected
    end
  end
end
