class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :favorites
  has_many :favorited_products, through: :favorites, source: :product
  has_one :cart
  has_one_attached :avatar
end
