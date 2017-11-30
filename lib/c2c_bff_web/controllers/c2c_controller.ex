defmodule C2cBffWeb.C2cController do
  use C2cBffWeb, :controller
  require Logger

#   @empty %{}

  def get(conn, _params) do
    task1 = Task.async(fn () -> chama(0, 1) end)
    task2 = Task.async(fn () -> chama(1000, 2) end)
    task3 = Task.async(fn () -> chama(2000, 3) end)
    a = %{ result1: Task.await(task1), result2: Task.await(task2), result3: Task.await(task3) }
    json(conn, a)
    # json(conn, @empty)
  end

  def get_dois(conn, _params) do
    Logger.debug "foi"
    task1 = Task.async(fn () -> chama(0, 1) end)
    a = %{ result1: Task.await(task1) }
    json(conn, a)
    # json(conn, @empty)
  end

  defp chama(offset, a) do
    # if a === 2, do: :timer.sleep(3000)
    HTTPoison.get!("http://services.mktp.back.b2w/yoda-partner/yoda-partner/partner?limit=1000&offset=#{offset}")
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("partners")
  end

end