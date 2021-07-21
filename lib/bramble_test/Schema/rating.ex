defmodule BrambleTest.Schema.Rating do

  use Ecto.Schema
  import Ecto.Changeset

  schema "rating" do
    field :name, :string
    field :quantity, :integer
    timestamps()
  end

  @required_attrs ~w(name)a
  @optional_attrs ~w(quantity )a
  @create_attrs @required_attrs ++ @optional_attrs

  def changeset(rating, attrs) do
    rating
    |> cast(attrs, @create_attrs)
    |> validate_required(@required_attrs)
  end
end
