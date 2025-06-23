RSpec.describe Product, type: :model do
  let(:product) { build(:product)}
  it "has a stock quantity that is an integer" do
    expect(product.stock_quantity).to be_an(Integer)
  end
  it "has a valid product name" do
    expect(product.name).to be_present
  end

  it "has a stock product price greater than 0" do
    expect(product.price).to be > 0
  end

  it "is valid with valid attributes" do
    expect(product).to be_valid
  end
end
