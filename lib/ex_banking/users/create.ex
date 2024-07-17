defmodule ExBanking.Users.Create do
  alias Hex.API.User
  alias ExBanking.Users.User
  alias ExBanking.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
