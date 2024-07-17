defmodule ExBanking.Users.Paginate do
  alias ExBanking.Users.User
  alias ExBanking.Repo

  def call(_param) do
    User
    |> Repo.all()
  end
end
