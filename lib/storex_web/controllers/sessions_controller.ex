defmodule StorexWeb.SessionController do
  use StorexWeb, :controller
  alias Storex.Accounts
  alias StorexWeb.Plugs.CurrentUser
  alias StorexWeb.Plugs.Cart

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"credentials" =>
                      %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome to Stores")
        |> CurrentUser.set(user)
        |> redirect(to: cart_path(conn, :show))
      {:error, _} ->
        conn
        |> put_flash(:error, "Unable to sign in")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> CurrentUser.forget()
    |> Cart.forget()
    |> redirect(to: "/")
  end
end
