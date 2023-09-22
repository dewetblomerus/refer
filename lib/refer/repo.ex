defmodule Refer.Repo do
  use Ecto.Repo,
    otp_app: :refer,
    adapter: Ecto.Adapters.Postgres

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
