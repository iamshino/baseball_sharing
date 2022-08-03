FactoryBot.define do
  factory :article do
    title { Faker::Name.name }
    content { Faker::Address.city }
  end
end
