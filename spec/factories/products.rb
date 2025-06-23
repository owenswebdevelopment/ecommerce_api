FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { 9.99 }
    stock_quantity { 1 }
  end
end
