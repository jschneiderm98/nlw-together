defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "basic functionality index/2" do
    test "in: valid params -> out: imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      expected = %{
        "result" => %{
          "Dani" => 23.437499999999996,
          "Diego" => 23.04002019946976,
          "Gabul" => 22.857142857142858,
          "Julio" => 35.06208911614317,
          "Rodrigo" => 26.234567901234566
        }
      }

      actual =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert actual == expected
    end

    test "in: invalid params -> out: error message", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      expected = %{"result" => "Error while opening the file"}

      actual =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert actual == expected
    end
  end
end
