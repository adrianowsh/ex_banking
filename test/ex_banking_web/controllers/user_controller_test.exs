defmodule ExBankingWeb.UserControllerTest do
  alias ExBanking.Users.User
  use ExBankingWeb.ConnCase

  import ExBanking.UsersFixtures

  @create_attrs %{
    name: "User 1",
    email: "user_1@email.com",
    zip_code: "064010615",
    password: "1234567",
    password_confirmation: "1234567"
  }

  @update_attrs %{
    name: "name updated",
    email: "updated@email.com"
  }

  @invalid_attrs %{
    name: nil,
    email: nil,
    zip_code: nil,
    password: nil,
    password_confirmation: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index/2" do
    test "list all users", %{conn: conn} do
      conn = get(conn, ~p"/api/users")
      assert json_response(conn, :ok)["data"] == []
    end
  end

  describe "create/2" do
    test "renders users when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @create_attrs)
      assert %{"id" => _id} = json_response(conn, :created)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @invalid_attrs)
      assert json_response(conn, 422) != %{}
    end
  end

  describe "update/3" do
    setup [:create_user]

    test "render updated user when data is valid", %{conn: conn, user: %User{id: id} = _user} do
      conn = put(conn, ~p"/api/users/#{id}", user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: %User{id: id} = _user} do
      conn = put(conn, ~p"/api/users/#{id}", user: @invalid_attrs)
      assert json_response(conn, 422) != %{}
    end
  end

  describe "delete url" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: %User{id: id}} do
      conn = delete(conn, ~p"/api/users/#{id}")
      assert response(conn, 204)

      # assert_error_sent 404, fn ->
      #   get(conn, ~p"/api/users/#{id}")
      # end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
