class AddSlugToArticles < ActiveRecord::Migration[5.1]
  def change
      add_column :articles,:article_slug, :string
  end
end
