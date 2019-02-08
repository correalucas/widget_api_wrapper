FactoryBot.define do
  factory :user do
    first_name { Faker::Internet.username }
    last_name { Faker::HarryPotter.house }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    image_url { Faker::Avatar.image }
  end
end
