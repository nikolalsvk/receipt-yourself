FactoryGirl.define do
  factory :business_partner_account do
  	number { Faker::Number.number(10) } 
  	activated false
  end
end