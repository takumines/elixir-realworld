defmodule Realworld.Repo.Migrations.CreateArticleTags do
  use Ecto.Migration

  def change do
    create table(:article_tags, primary_key: false) do
      add :article_id, references(:articles, on_delete: :nothing), null: false
      add :tag_id, references(:tags, on_delete: :nothing), null: false

      # timestamps(type: :utc_datetime)
    end

    create index(:article_tags, [:article_id])
    create index(:article_tags, [:tag_id])
  end
end
