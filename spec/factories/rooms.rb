FactoryBot.define do
  factory :room do
    name { "MyString" }
    description { "MyText" }
    price { 1 }
    address { "MyString" }
    user { nil }
  end
end
