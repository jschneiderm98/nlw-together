defmodule WabanexWeb.Resolvers.User do
  def create(%{input: params}, _context), do: Wabanex.User.Create.call(params)
  def get(%{id: user_id}, _context), do: Wabanex.User.Get.call(user_id)

  def update(%{id: id, input: params}, _context),
    do: Wabanex.User.Update.call(id, params)
end
