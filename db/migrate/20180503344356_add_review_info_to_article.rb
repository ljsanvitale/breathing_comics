class AddReviewInfoToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles,:story_by, :string
    add_column :articles,:art_by, :string
    add_column :articles,:number_pages, :integer
    add_column :articles,:publisher, :string
    add_column :articles,:published_at, :datetime
    add_column :articles,:cover_price, :string
  end
end
