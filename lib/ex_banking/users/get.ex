defmodule ExBanking.Users.Get do
  alias ExBanking.Users.User
  alias ExBanking.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
