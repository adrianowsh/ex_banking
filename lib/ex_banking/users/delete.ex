defmodule ExBanking.Users.Delete do
  alias ExBanking.Repo
  alias ExBanking.Users.User

  def call(%User{} = user) do
    Repo.delete(user)
  end
end
