defmodule ExBankingWeb.UserController do
  use ExBankingWeb, :controller

  alias ExBanking.Users.User
  alias ExBanking.Users.Create
  alias ExBanking.Users.Get
  alias ExBanking.Users.Paginate

  action_fallback ExBankingWeb.FallbackController

  def index(conn, params) do
    users = Paginate.call(params)
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Create.call(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Get.call(id)
    render(conn, :show, user: user)
  end
end
