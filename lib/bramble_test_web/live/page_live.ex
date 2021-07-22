defmodule BrambleTestWeb.PageLive do
  use BrambleTestWeb, :live_view
  alias BrambleTest.Model.Rating

  @impl true
  def mount(_params, _session, socket) do
    ratings = Rating.list_ratings()
    chart_value = cal_chart_value(ratings)
    {:ok, assign(socket, chart_value: chart_value, ratings: ratings)}
  end

  @impl true
  def handle_event("submit", %{"name" => name, "quantity" => quantity}, socket) do
    Rating.create_rating(%{"name" => name, "quantity" => quantity})
    ratings = Rating.list_ratings()
    chart_value = cal_chart_value(ratings)
    {:noreply,
      socket
      |> put_flash(:success, "Rating added successfully")
      |> assign(results: %{}, chart_value: chart_value, ratings: ratings)}
  end

  defp cal_chart_value(ratings) do
    Enum.reduce(ratings, %{"atoi"=> 0, "jtor"=> 0, "stoz"=> 0}, fn(rating, accumulator) ->
      cond do
        "abcdefghiABCDEFGHI" =~ String.at(rating.name, 0) ->
          Map.put(accumulator, "atoi", accumulator["atoi"] + rating.quantity)
        "jklmnopqJKLMNOPQR" =~ String.at(rating.name, 0) ->
          Map.put(accumulator, "jtor", accumulator["jtor"] + rating.quantity)
        "stuvwxyzSTUVWXYZ" =~ String.at(rating.name, 0) ->
          Map.put(accumulator, "stoz", accumulator["stoz"] + rating.quantity)
      end
    end)
  end
end
