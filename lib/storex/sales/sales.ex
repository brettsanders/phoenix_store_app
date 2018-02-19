defmodule Storex.Sales do
  import Ecto.Query, warn: false
  alias Storex.Repo
  alias Storex.Sales.{Cart, LineItem}

  def create_cart(attrs \\ %{}) do
    %Cart{}
    |> Cart.changeset(attrs)
    |> Repo.insert()
  end
end
