defmodule ExBanking.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @field [:name, :password_hash, :email, :zip_code]
  @required_fields @field

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash
    field :email, :string
    field :zip_code, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @field)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:zip_code, min: 8)
    |> validate_format(:email, ~r/@/)
    |> add_password_hash
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_hash, Argon2.hash_pwd_salt(password))
    |> delete_change(:password)
  end

  defp add_password_hash(changeset), do: changeset
end
