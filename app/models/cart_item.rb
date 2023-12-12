class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  delegate :price, to: :product, allow_nil: true
end
