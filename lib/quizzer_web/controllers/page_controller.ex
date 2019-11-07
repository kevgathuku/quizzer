defmodule QuizzerWeb.PageController do
  use QuizzerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
