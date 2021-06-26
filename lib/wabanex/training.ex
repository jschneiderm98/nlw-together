defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{User, Exercise}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:start_date, :end_date, :user_id]

  schema "training" do
    field :start_date, :date, null: false
    field :end_date, :date, null: false

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> cast_assoc(:exercises)
  end
end
