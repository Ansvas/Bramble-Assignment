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
    atoi =
    Enum.reduce(ratings,0, fn(rating, accumulator) ->
      if "abcdefghiABCDEFGHI" =~ String.at(rating.name, 0) do
        accumulator + rating.quantity
      else
        accumulator
      end
    end)

      jtor =
      Enum.reduce(ratings,0, fn(rating, accumulator) ->
        if "jklmnopqJKLMNOPQR" =~ String.at(rating.name, 0) do
          accumulator + rating.quantity
        else
          accumulator
        end
      end)

      stoz =
      Enum.reduce(ratings,0, fn(rating, accumulator) ->
        if "stuvwxyzSTUVWXYZ" =~ String.at(rating.name, 0) do
          accumulator + rating.quantity
        else
          accumulator
        end
      end)

        %{
          atoi: atoi,
          jtor: jtor,
          stoz: stoz
        }
end
end
