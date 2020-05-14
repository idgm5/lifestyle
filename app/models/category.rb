class Category < ApplicationRecord
  has_many :articles

  validates :name, presence: true
  validates :priority, presence: true, numericality: { only_integer: true }
end
