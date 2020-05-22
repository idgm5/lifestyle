class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_one_attached :image
  has_many :votes

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :image, presence: true
  
end
