require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    username     { Faker::Internet.user_name }
    password     { Faker::Internet.password }
    first_name   { Faker::Name.first_name }
    last_name    { Faker::Name.last_name }
    email        { Faker::Internet.email }
    phone_number { PhoneNumber.cell_phone }
  end

  factory :post do
    first_name   { Faker::Name.first_name }
    last_name    { Faker::Name.last_name }
    email        { Faker::Internet.email }
    phone_number { PhoneNumber.cell_phone }
    user
  end
end
