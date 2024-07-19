defmodule ExBanking.UsersFixtures do
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "User 1",
        email: "user_1@email.com",
        zip_code: "064010615",
        password: "1234567",
        password_confirmation: "1234567"
      })
      |> ExBanking.Users.create_user()

    user
  end
end
