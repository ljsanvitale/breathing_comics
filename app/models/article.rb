class Article < ApplicationRecord

  belongs_to :author
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  #has_attached_file :main_image#,
  #:styles => {
  #   :thumb => "100x100#",
  #   :small  => "150x150>",
  #   :medium => "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #validates_attachment_content_type :main_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  default_scope { order(created_at: :desc) }
  scope :article_list, ->{where("articles.article_type IN (?) AND articles.published=? ", ["news", "notes"],true).order(created_at: :desc)}
  scope :article_reviews, -> { where("articles.article_type=? AND articles.published=? ",  'review',true).order(created_at: :desc) }
  scope :admin_article_reviews, -> { where("articles.article_type=?",  'review').order(created_at: :desc) }
  scope :article_notes, -> { where("articles.article_type=? AND articles.published=? ",  'notes',true).order(created_at: :desc) }
  scope :admin_article_notes, -> { where("articles.article_type=?",  'notes').order(created_at: :desc) }
  scope :article_previews, -> { where("articles.article_type=? AND articles.published=? ",  'preview',true).order(created_at: :desc) }
  scope :admin_article_previews, -> { where("articles.article_type=?",  'preview').order(created_at: :desc) }
  scope :article_news, -> { where("articles.article_type=? AND articles.published=? ",  'news',true).order(created_at: :desc) }
  scope :admin_article_news, -> { where("articles.article_type=?",  'news').order(created_at: :desc) }

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
  def self.all_except(article)
    where.not(id: article)
  end

  def slug
   title.downcase.gsub(" ", "-")
 end

 def to_param
  "#{id}-#{slug}"
  end
end
