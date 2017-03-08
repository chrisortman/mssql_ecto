defmodule MssqlEcto.DeleteTest do
  use ExUnit.Case, async: true

  alias MssqlEcto.Connection, as: SQL
  
  test "delete" do
    query = SQL.delete(nil, "schema", [:x, :y], [])
    assert query == ~s{DELETE FROM "schema" WHERE "x" = ? AND "y" = ?}

    query = SQL.delete(nil, "schema", [:x, :y], [:z])
    assert query == ~s{DELETE FROM "schema" WHERE "x" = ? AND "y" = ? OUTPUT DELETED."z"}

    query = SQL.delete("prefix", "schema", [:x, :y], [])
    assert query == ~s{DELETE FROM "prefix"."schema" WHERE "x" = ? AND "y" = ?}
  end
end