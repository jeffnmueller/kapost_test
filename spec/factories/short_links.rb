FactoryBot.define do
  factory :short_link do
    url { Faker::Internet.url }
  end
end
