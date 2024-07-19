defmodule ExBanking.Users.Paginate do
  alias ExBanking.Repo
  alias ExBanking.Users.User

  def call(_param) do
    User
    |> Repo.all()
  end
end
