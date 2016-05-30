FactoryGirl.define do
  factory :contact_card do
  	pib { Faker::Number.number(8) }
  	country { Faker::Address.country }
  	city { Faker::Address.city }
  	address { Faker::Address.street_address }
  	email { Faker::Internet.email }
  	website { Faker::Internet.url }
  	phone { Faker::PhoneNumber.phone_number } 
  end
end