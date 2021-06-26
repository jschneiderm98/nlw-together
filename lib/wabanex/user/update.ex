defmodule Wabanex.User.Update do
  alias Wabanex.{Repo, User}

  def call(uuid, params) do
    case User.Get.call(uuid) do
      {:error, message} -> {:error, message}
      {:ok, user} -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> Ecto.Changeset.change(params)
    |> Repo.update()
  end
end
