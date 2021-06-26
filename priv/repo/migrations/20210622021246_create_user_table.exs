defmodule Wabanex.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string, null: false
      add :name, :string, null: false
      add :password, :string, null: false

      timestamps()
    end

    create unique_index(:user, [:email])
  end
end
