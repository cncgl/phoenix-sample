defmodule HelloPhoenix.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :status, :boolean, default: false
      add :title, :string

      timestamps
    end

  end
end
