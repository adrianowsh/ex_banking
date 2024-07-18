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
    with {:ok, user} <- Users.get_user(id) do
      conn
      |> render(:show, user: user)
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    with {:ok, user} <- Users.get_user(id),
         {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, user} <- Users.get_user(id),
         {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
