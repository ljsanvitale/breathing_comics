class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  has_attached_file :main_image#,
  #:styles => {
  #   :thumb => "100x100#",
  #   :small  => "150x150>",
  #   :medium => "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_attachment_content_type :main_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  scope :main_articles, -> { where(article_type: 'main').order(created_at: :desc) }
  scope :article_list, -> { where(article_type: 'list').order(created_at: :desc) }

  def tag_list
    self.tags.collect do |tag|
    tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags

  end

end
