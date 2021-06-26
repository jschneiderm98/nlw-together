defmodule Wabanex.Repo.Migrations.CreateTrainingTable do
  use Ecto.Migration

  def change do
    create table(:training) do
      add :start_date, :date, null: false
      add :end_date, :date, null: false
      add :user_id, references(:user), null: false

      timestamps()
    end
  end
end
