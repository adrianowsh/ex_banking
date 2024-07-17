defmodule ExBanking.Users.Get do
  alias ExBanking.Users.User
  alias ExBanking.Repo

  def call(id) do
    User |> Repo.get(id)
  end
end
