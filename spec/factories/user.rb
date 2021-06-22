FactoryBot.define do
  factory :user do
    name { 'taro' }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end