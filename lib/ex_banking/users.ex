defmodule ExBanking.Users do
  alias ExBanking.Users.Paginate
  alias ExBanking.Users.Get
  alias ExBanking.Users.Create

  defdelegate create_user(params), to: Create, as: :call
  defdelegate get_user(id), to: Get, to: Get, as: :call
  defdelegate get_users(params), to: Paginate, as: :call
end
