class AddTypeToArticles < ActiveRecord::Migration[5.1]
  def change
      add_column :articles,:article_type, :string
  end
end
