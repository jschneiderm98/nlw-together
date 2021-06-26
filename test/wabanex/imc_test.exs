defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1 basic functionality" do
    test "in: valid file -> out: :ok, valid imc object" do
      params = %{"filename" => "students.csv"}

      expected =
        {:ok,
         %{
           "Dani" => 23.437499999999996,
           "Diego" => 23.04002019946976,
           "Gabul" => 22.857142857142858,
           "Julio" => 35.06208911614317,
           "Rodrigo" => 26.234567901234566
         }}

      actual = IMC.calculate(params)

      assert expected == actual
    end

    test "in: invalid file -> out: :error, reason" do
      params = %{"filename" => "banana.csv"}

      expected = {:error, "Error while opening the file"}

      actual = IMC.calculate(params)

      assert expected == actual
    end
  end
end
