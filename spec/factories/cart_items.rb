FactoryBot.define do
  factory :cart_item do
    product { nil }
    quantity { 1 }
    session_id { "MyString" }
  end
end
