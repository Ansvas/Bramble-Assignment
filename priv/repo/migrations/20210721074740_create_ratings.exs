defmodule BrambleTest.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table("rating") do
      add :name,    :string
      add :quantity, :integer

      timestamps()
    end
  end
end
