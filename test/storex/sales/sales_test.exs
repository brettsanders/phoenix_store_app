defmodule Storex.SalesTest do
  use Storex.DataCase
  alias Storex.{Sales, Store}

  describe "carts" do
    alias Storex.Sales.Cart

    test "create_cart/0 creates a cart" do
      assert {:ok, %{}} = Sales.create_cart()
    end

    test "get_cart!/1" do
      {:ok, cart} = Sales.create_cart()
      assert Sales.get_cart!(cart.id) == cart
    end

    test "add_book_to_cart/2 creates or increments a line_item" do
      {:ok, book} = Store.create_book(%{
        title: "Title",
        description: "Description",
        image_url: "product.jpg",
        price: "29.90"
      })

      {:ok, cart} = Sales.create_cart()
      {:ok, line_item1} = Sales.add_book_to_cart(book, cart)
      {:ok, line_item2} = Sales.add_book_to_cart(book, cart)

      assert line_item1.quantity == 1
      assert line_item1.book_id == book.id
      assert line_item1.cart_id == cart.id
      assert line_item1.id == line_item2.id
      assert line_item2.quantity == 2
    end

    test "remove_book_from_cart/2 decrements or deletes a line_item" do
      {:ok, book} = Store.create_book(%{
        title: "Title",
        description: "Description",
        image_url: "product.jpg",
        price: "29.90"
      })

      {:ok, cart} = Sales.create_cart()

      Sales.add_book_to_cart(book, cart)
      Sales.add_book_to_cart(book, cart)

      {:ok, line_item} = Sales.remove_book_from_cart(book, cart)
      assert line_item.quantity == 1

      Sales.remove_book_from_cart(book, cart)

      assert_raise Ecto.NoResultsError, fn ->
        Sales.remove_book_from_cart(book, cart)
      end
    end

  end
end
