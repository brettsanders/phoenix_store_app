defmodule Storex.Sales.Cart do
  use Ecto.Schema
  import Ecto.Changeset
  alias Storex.Sales.Cart


  schema "sales_carts" do

    timestamps()
  end

  @doc false
  def changeset(%Cart{} = cart, attrs) do
    cart
    |> cast(attrs, [])
    |> validate_required([])
  end
end
