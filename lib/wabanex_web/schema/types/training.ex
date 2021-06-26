defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  @desc "Returnable training fields"
  object :training do
    field :id, non_null(:uuid4), description: "Training id, uuid4"
    field :start_date, non_null(:date), description: "DataTime where the training start"
    field :end_date, non_null(:date), description: "DataTime where the training ends"

    field :exercises, list_of(:exercise),
      description: "List of exercise that are part of the training"
  end

  @desc "Fields to create training"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "Id of the user who has the training, uuid4"
    field :start_date, non_null(:date), description: "DataTime where the training start"
    field :end_date, non_null(:date), description: "DataTime where the training ends"

    field :exercises, non_null(list_of(:create_exercise_input)),
      description: "List of exercise creations"
  end
end
