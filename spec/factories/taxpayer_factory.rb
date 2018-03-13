FactoryBot.define do
  factory :taxpayer do
    email { Faker::Internet.email }
    password 'secretpassword'
    password_confirmation 'secretpassword'
  end
end
