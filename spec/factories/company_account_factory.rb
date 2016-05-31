FactoryGirl.define do
  factory :company_account do
  	number { Faker::Number.number(10) }
  	currency { 1 } 
  end
end