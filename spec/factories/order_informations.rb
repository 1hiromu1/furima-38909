FactoryBot.define do
  factory :order_information do
    post_code        { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    municipalities   { Faker::Address.city }
    address          { Faker::Address.street_address }
    building_name    { Faker::Address.secondary_address }
    telephone_number { Faker::Number.number(digits: [10, 11].sample) }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
