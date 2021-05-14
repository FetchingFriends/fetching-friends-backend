FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.free_email }
  end
end
