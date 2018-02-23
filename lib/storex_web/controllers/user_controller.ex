defmodule StorexWeb.UserController do
  use StorexWeb, :controller
  alias Storex.Accounts

  def new(conn, params) do
    changeset = Accounts.new_user()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> redirect(to: cart_path(conn, :show))  
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
