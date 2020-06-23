defmodule RapiTest do
  use ExUnit.Case
  doctest Rapi

  test "greets the world" do
    assert Rapi.hello() == :world
  end
end
