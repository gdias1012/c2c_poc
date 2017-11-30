defmodule C2cBffWeb.Router do
  use C2cBffWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", C2cBffWeb do
    pipe_through(:api)
    get "/vai", C2cController, :get
    get "/foi", C2cController, :get_dois
  end

end