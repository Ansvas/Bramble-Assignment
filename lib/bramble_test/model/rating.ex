defmodule BrambleTest.Model.Rating do

  import Ecto.Query, warn: false
  alias BrambleTest.Repo

  alias BrambleTest.Schema.Rating

  @doc """
  Returns the list of Locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """

  def list_ratings do
    Repo.all(Rating)
  end

  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

end
