defmodule BrambleTest.Repo do
  use Ecto.Repo,
    otp_app: :bramble_test,
    adapter: Ecto.Adapters.Postgres
end
