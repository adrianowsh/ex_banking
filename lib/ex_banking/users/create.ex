defmodule ExBanking.Users.Create do
  alias ExBanking.Repo
  alias ExBanking.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
