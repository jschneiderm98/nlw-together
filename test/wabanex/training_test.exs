defmodule Wabanex.TrainingTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.Training

  describe "changeset/1 basic functionality" do
    test "in: valid params -> out: user ecto valid changeset" do
      params = %{
        end_date: "2021-10-15",
        start_date: "2021-09-15",
        user_id: "58f4359c-c106-4688-a056-7862b8fc20e0",
        exercises: [
          %{
            name: "Correr",
            youtube_video_url: "youtube.com",
            repetitions: "4x20",
            protocol_description: "drop-set"
          },
          %{
            name: "Triceps banco",
            youtube_video_url: "youtube.com",
            repetitions: "2x20",
            protocol_description: "regular"
          }
        ]
      }

      actual = Training.changeset(params)

      # pattern matching, not equal.
      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 end_date: ~D[2021-10-15],
                 exercises: [
                   %Ecto.Changeset{
                     valid?: true,
                     changes: %{
                       name: "Correr",
                       protocol_description: "drop-set",
                       repetitions: "4x20",
                       youtube_video_url: "youtube.com"
                     },
                     errors: []
                   },
                   %Ecto.Changeset{
                     valid?: true,
                     changes: %{
                       name: "Triceps banco",
                       protocol_description: "regular",
                       repetitions: "2x20",
                       youtube_video_url: "youtube.com"
                     },
                     errors: []
                   }
                 ]
               },
               errors: []
             } = actual
    end
  end
end
