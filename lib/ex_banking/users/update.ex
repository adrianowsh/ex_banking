defmodule ExBanking.Users.Update do
  alias ExBanking.Repo
  alias ExBanking.Users.User

  def call(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
