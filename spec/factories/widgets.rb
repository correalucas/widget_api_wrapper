FactoryBot.define do
  kind = %i[visible hidden].sample
  factory :widget do
    name { Faker::Name.name }
    description { Faker::Hobbit.quote }
    kind { kind }
  end
end
