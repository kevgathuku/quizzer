defmodule QuizzerWeb.Router do
  use QuizzerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # How to add a plug to be run in a pipeline
    # plug QuizzerWeb.Plugs.BackgroundJob
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QuizzerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    # Using unmatchable routes like the one below raises errors on
    # running mix.compile
    # get "/", RootController, :index

    # Generating the most common routes for a resource
    resources "/users", UserController

    # Forwarding requests to a plug
    forward "/jobs", Plugs.BackgroundJob
  end

  # Other scopes may use custom stacks.
  # scope "/api", QuizzerWeb do
  #   pipe_through :api
  # end
end
