FactoryBot.define do
  factory :comment do
    user { nil }
    article { nil }
    comment { "MyText" }
  end
end
