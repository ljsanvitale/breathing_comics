class Tag < ApplicationRecord
has_many :taggings
has_many :articles, through: :taggings

def to_s
  name
end

def slug
 name.downcase.gsub(" ", "-")
end

def to_param
"#{id}-#{slug}"
end
end
