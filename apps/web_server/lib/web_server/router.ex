defmodule WebServer.Router do
  # This gives us access to all the methods we're going to use here like `get/1`
  use Plug.Router
  # This shows a nice page when we fail to find routes
  use Plug.Debugger
  # This means we'll log requests
  plug(Plug.Logger)

  # These are Required [citation needed]
  plug(:match)
  plug(:dispatch)

  # This is the magic!
  get "/hello" do
    send_resp(conn, 200, "I mean, Hi?\n")
  end

  # This just avoids irritating errors when using a browser, ignore this
  get "/favicon.ico" do
    send_resp(conn, 200, "Go away stupid browser, no icon for you")
  end
end
