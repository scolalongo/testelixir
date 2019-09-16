defmodule Testelixir do
  require Logger

  @moduledoc """
  Documentation for Testelixir.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Testelixir.hello()
      :world

  """
  def hello do
    :world
  end

  def init(_) do
    #IO.puts System.get_env("DB_NAME")
    Logger.info("totototototo")
  end
end
