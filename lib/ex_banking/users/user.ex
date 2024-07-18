defmodule ExBanking.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @required_create_fields [:name, :password, :email, :password, :password_confirmation, :zip_code]
  @required_update_fields [:name, :email, :zip_code]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash
    field :email, :string
    field :zip_code, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_create_fields)
    |> do_validations(@required_create_fields)
    |> validate_length(:password, min: 7)
    |> validate_confirmation(:password)
    |> add_password_hash
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_update_fields)
    |> do_validations(@required_update_fields)
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:zip_code, min: 8)
    |> validate_format(:email, ~r/@/)
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_hash, Argon2.hash_pwd_salt(password))
    |> delete_change(:password)
    |> delete_change(:password_confirmation)
  end

  defp add_password_hash(changeset), do: changeset
end
