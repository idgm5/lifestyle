class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :image
end
