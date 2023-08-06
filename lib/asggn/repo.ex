defmodule Asggn.Repo do
  use Ecto.Repo,
    otp_app: :asggn,
    adapter: Ecto.Adapters.Postgres
end
