defmodule Quizzer.Repo do
  use Ecto.Repo,
    otp_app: :quizzer,
    adapter: Ecto.Adapters.Postgres
end
