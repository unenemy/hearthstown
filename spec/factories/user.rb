FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    nickname Faker::Name.name
    password Faker::Internet.password
  end
end
