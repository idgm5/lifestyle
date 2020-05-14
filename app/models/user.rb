class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, class_name: 'Article'
end
