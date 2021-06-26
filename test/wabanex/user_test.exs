defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1 basic functionality" do
    test "in: valid params -> out: user ecto valid changeset" do
      params = %{name: "Julio", email: "julio@email.com", password: "123456"}

      actual = User.changeset(params)

      # pattern matching, not equal.
      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "julio@email.com", name: "Julio", password: "123456"},
               errors: []
             } = actual
    end

    test "in: invalid params -> out: user ecto invalid changeset" do
      params = %{name: "J", email: "julio@email.com"}

      expected_errors = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      actual = User.changeset(params)

      assert errors_on(actual) == expected_errors
    end
  end
end
