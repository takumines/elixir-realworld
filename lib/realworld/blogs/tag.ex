defmodule Realworld.Blogs.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :tag, :string

    timestamps(type: :utc_datetime)
  end

  def parse(nil), do: parse("")

  def parse(tags) do
    tags
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag])
    |> validate_required([:tag])
    |> unique_constraint(:tag)
  end
end
