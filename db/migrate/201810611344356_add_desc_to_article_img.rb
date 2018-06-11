class AddDescToArticleImg < ActiveRecord::Migration[5.1]
  def change
    add_column :articles,:img_desc, :string
    add_column :articles,:img_alt_text, :string

  end
end
