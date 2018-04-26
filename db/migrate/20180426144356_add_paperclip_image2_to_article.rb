class AddPaperclipImage2ToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :main_image_file_name,    :string
    add_column :articles, :main_image_content_type, :string
    add_column :articles, :main_image_file_size,    :integer
    add_column :articles, :main_image_updated_at,   :datetime
  end
end
