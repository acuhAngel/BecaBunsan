defmodule PetClinicWeb.OwnerController do
  use PetClinicWeb, :controller

  alias PetClinic.PetClinicOwners
  alias PetClinic.PetClinicOwners.Owner

  def index(conn, _params) do
    owners = PetClinicOwners.list_owners()
    render(conn, "index.html", owners: owners)
  end

  def new(conn, _params) do
    changeset = PetClinicOwners.change_owner(%Owner{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"owner" => owner_params}) do
    case PetClinicOwners.create_owner(owner_params) do
      {:ok, owner} ->
        conn
        |> put_flash(:info, "Owner created successfully.")
        |> redirect(to: Routes.owner_path(conn, :show, owner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    owner = PetClinicOwners.get_owner!(id)
    render(conn, "show.html", owner: owner)
  end

  def edit(conn, %{"id" => id}) do
    owner = PetClinicOwners.get_owner!(id)
    changeset = PetClinicOwners.change_owner(owner)
    render(conn, "edit.html", owner: owner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "owner" => owner_params}) do
    owner = PetClinicOwners.get_owner!(id)

    case PetClinicOwners.update_owner(owner, owner_params) do
      {:ok, owner} ->
        conn
        |> put_flash(:info, "Owner updated successfully.")
        |> redirect(to: Routes.owner_path(conn, :show, owner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", owner: owner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    owner = PetClinicOwners.get_owner!(id)
    {:ok, _owner} = PetClinicOwners.delete_owner(owner)

    conn
    |> put_flash(:info, "Owner deleted successfully.")
    |> redirect(to: Routes.owner_path(conn, :index))
  end
end
