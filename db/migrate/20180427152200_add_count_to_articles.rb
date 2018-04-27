class AddCountToArticles < ActiveRecord::Migration[5.1]
  def up
      add_column :articles,:count_views, :integer, :default => 0
  end

  def down
        remove_column :articles, :count_views
  end
end
