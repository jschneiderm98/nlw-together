defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Returnable user fields"
  object :user do
    field :id, non_null(:uuid4), description: "Users id, uuid4"
    field :name, non_null(:string), description: "Users name, string"
    field :email, non_null(:string), description: "Users email, email string"

    field :training, list_of(:training),
      description:
        "The one current training of the user(returns the first created if there are concurrent trainings)"
  end

  @desc "Fields to create exercise"
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name, string"
    field :email, non_null(:string), description: "Users email, email string"
    field :password, non_null(:string), description: "Users password, string"
  end
end
