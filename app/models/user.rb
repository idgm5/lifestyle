class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, class_name: 'Article'
  has_many :votes

  validates :name, presence: { message: 'This name already exists' }
  validates :name, uniqueness: { message: 'Name must be unique' }
end
