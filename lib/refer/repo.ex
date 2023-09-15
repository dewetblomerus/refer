defmodule Refer.Repo do
  use Ecto.Repo,
    otp_app: :refer,
    adapter: Ecto.Adapters.Postgres
end
