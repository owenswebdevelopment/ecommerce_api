class CartItem < ApplicationRecord
  belongs_to :product
  validates :product, presence: true
  validates :session_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validate :product_does_not_exceed_stock

  def product_does_not_exceed_stock
    return if product.nil? || quantity.nil?
    if product > product.stock_quantity
      errors.add(:quantity, 'cannot be greater than available')
    end
  end
end
