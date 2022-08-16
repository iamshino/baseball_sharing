FactoryBot.define do
  factory :comment do
    association :user
    association :article
    comment { "MyText" }
  end
end
