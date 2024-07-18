defmodule ExBankingWeb.UserController do
  use ExBankingWeb, :controller

  alias ExBanking.Users
  alias ExBanking.Users.User

  action_fallback ExBankingWeb.FallbackController

  def index(conn, params) do
    users = Users.get_users(params)
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user(id)
    render(conn, :show, user: user)
  end
end
