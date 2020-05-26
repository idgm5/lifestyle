FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    priority { Faker::Number.between(from: 0, to: 10) }
  end
end
