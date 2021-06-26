defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors

  alias WabanexWeb.Resolvers
  alias WabanexWeb.Schema.Types

  import_types Absinthe.Type.Custom
  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training
  import_types Types.Exercise

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &Resolvers.User.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)
      resolve &Resolvers.User.create/2
      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)
      resolve &Resolvers.Training.create/2
      middleware TranslateErrors
    end
  end
end