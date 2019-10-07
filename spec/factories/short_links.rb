FactoryBot.define do
  factory :short_link do
    long_url { Faker::Internet.url }
  end
end
