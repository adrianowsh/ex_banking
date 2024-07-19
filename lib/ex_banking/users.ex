defmodule ExBanking.Users do
  alias ExBanking.Users.Create
  alias ExBanking.Users.Delete
  alias ExBanking.Users.Get
  alias ExBanking.Users.Paginate
  alias ExBanking.Users.Update

  defdelegate create_user(params), to: Create, as: :call
  defdelegate get_user(id), to: Get, as: :call
  defdelegate get_users(params), to: Paginate, as: :call
  defdelegate update_user(user, attrs), to: Update, as: :call
  defdelegate delete_user(user), to: Delete, as: :call
end
