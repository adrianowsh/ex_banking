defmodule ExBanking.Users.Get do
  alias ExBanking.Repo
  alias ExBanking.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
