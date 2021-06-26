defmodule WabanexWeb.TrainingSchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.User.Create

  describe "training mutations" do
    test "in: valid params -> creates training and exercises", %{conn: conn} do
      test_user = %{email: "julio123@email.com", name: "Julio", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(test_user)

      mutation = """
      mutation {
        createTraining(input: {
          endDate: "2021-07-15",
          startDate: "2021-06-15",
          userId: "#{user_id}",
          exercises: [
            {
              name: "Correr",
              youtubeVideoUrl: "youtube.com",
              repetitions: "4x20",
              protocolDescription: "drop-set"
            },
            {
              name: "Triceps banco",
              youtubeVideoUrl: "youtube.com",
              repetitions: "2x20",
              protocolDescription: "regular"
            },
            {
              name: "Triceps corda",
              youtubeVideoUrl: "youtube.com",
              repetitions: "3x30",
              protocolDescription: "regular"
            },
          ]
        }){
          exercises{
            name
            repetitions
            protocolDescription
            youtubeVideoUrl
          }
          startDate
          endDate
        }
      }
      """

      expected = %{
        "data" => %{
          "createTraining" => %{
            "endDate" => "2021-07-15",
            "exercises" => [
              %{
                "name" => "Correr",
                "protocolDescription" => "drop-set",
                "repetitions" => "4x20",
                "youtubeVideoUrl" => "youtube.com"
              },
              %{
                "name" => "Triceps banco",
                "protocolDescription" => "regular",
                "repetitions" => "2x20",
                "youtubeVideoUrl" => "youtube.com"
              },
              %{
                "name" => "Triceps corda",
                "protocolDescription" => "regular",
                "repetitions" => "3x30",
                "youtubeVideoUrl" => "youtube.com"
              }
            ],
            "startDate" => "2021-06-15"
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
