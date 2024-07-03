defmodule ExBanking.Repo do
  use Ecto.Repo,
    otp_app: :ex_banking,
    adapter: Ecto.Adapters.Postgres
end
