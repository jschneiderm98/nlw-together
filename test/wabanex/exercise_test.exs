defmodule Wabanex.ExerciseTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.Exercise

  describe "changeset/1 basic functionality" do
    test "in: valid params -> out: user ecto valid changeset" do
      params = %{
        name: "Remada",
        youtube_video_url: "youtube.com",
        protocol_description: "padrão",
        repetitions: "3x15"
      }

      actual = Exercise.changeset(%Wabanex.Exercise{}, params)

      # pattern matching, not equal.
      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 name: "Remada",
                 protocol_description: "padrão",
                 repetitions: "3x15",
                 youtube_video_url: "youtube.com"
               },
               errors: []
             } = actual
    end

    test "in: invalid params -> out: invalid changeset" do
      params = %{
        youtube_video_url: "youtube.com",
        protocol_description: "padrão"
      }

      expected_errors = %{repetitions: ["can't be blank"], name: ["can't be blank"]}

      actual = Exercise.changeset(%Wabanex.Exercise{}, params)

      assert errors_on(actual) == expected_errors
    end
  end
end
