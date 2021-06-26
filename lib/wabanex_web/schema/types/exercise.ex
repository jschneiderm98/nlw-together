defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Returnable exercise fields"
  object :exercise do
    field :id, non_null(:uuid4), description: "Exercise id, uuid4"
    field :name, non_null(:string), description: "Exercise name, string"

    field :youtube_video_url, non_null(:string),
      description: "Exercise youtube_url_video, links to youtube, string"

    field :protocol_description, non_null(:string),
      description: "Exercise protocol, standard functional etc., string"

    field :repetitions, non_null(:string),
      description: "Exercise repetions ex.: 3x15, 5 series of 15 repetions, string"
  end

  @desc "Fields to create exercise"
  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Exercise name, string"

    field :youtube_video_url, non_null(:string),
      description: "Exercise youtube_url_video, links to youtube, string"

    field :protocol_description, non_null(:string),
      description: "Exercise protocol, standard functional etc., string"

    field :repetitions, non_null(:string),
      description: "Exercise repetions ex.: 3x15, 5 series of 15 repetions, string"
  end
end
