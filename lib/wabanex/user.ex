defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:email, :password, :name]

  schema "user" do
    field :email, :string, null: false
    field :name, :string, null: false
    field :password, :string, null: false

    has_many :training, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
