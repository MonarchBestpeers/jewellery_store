class Product < ApplicationRecord
  has_one_attached :image
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user
end
