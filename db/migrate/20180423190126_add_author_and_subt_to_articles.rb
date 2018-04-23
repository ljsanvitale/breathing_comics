class AddAuthorAndSubtToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles,:author, :string
    add_column :articles,:subtitle, :text
  end
end
