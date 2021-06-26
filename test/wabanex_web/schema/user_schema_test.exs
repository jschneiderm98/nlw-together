defmodule WabanexWeb.UserSchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.User.Create

  describe "users queries" do
    test "get//in: valid id -> user", %{conn: conn} do
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
    test "create//in: valid params -> creates user", %{conn: conn} do
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

    test "update//in: valid params -> updates user", %{conn: conn} do
      create_mutation = """
        mutation {
          createUser(input: {name: "teste", email: "teste@email.com", password: "123456"}){
            id
          }
        }
      """

      aux =
        conn
        |> post("/api/graphql", %{query: create_mutation})
        |> json_response(:ok)

      aux_id = aux["data"]["createUser"]["id"]

      mutation = """
       mutation {
         updateUser(id: "#{aux_id}", input: {name: "Jorge", email: "jorge@email.com", password: "123456"}){
           id
           name
           email
         }
       }
      """

      expected = %{
        "data" => %{
          "updateUser" => %{
            "email" => "jorge@email.com",
            "id" => aux_id,
            "name" => "Jorge"
          }
        }
      }

      actual =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert actual == expected
    end
  end
end
