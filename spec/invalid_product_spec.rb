require 'rails_helper'

RSpec.describe Product, type: :model do
  it "You need to have a valid product name" do
    product = build(:product, name: nil )
    expect(product).not_to be_valid
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "You need to have a valid price" do
    product = build(:product, price: nil)
    expect(product).not_to be_valid
    product.valid?
    expect(product.errors[:price]).to include("is not a number")
  end
  it "Price should not be negative" do
    product = build(:product, price: -1)
    expect(product).not_to be_valid
    product.valid?
    expect(product.errors[:price]).to include("must be greater than 0")
  end

  it "is invalid with a decimal stock quantity" do
    product = build(:product, stock_quantity: 1.5)
    expect(product).not_to be_valid
    product.valid?
    expect(product.errors[:stock_quantity]).to include("must be an integer")
  end
end
