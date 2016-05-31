FactoryGirl.define do
  factory :bank do
  	name { Faker::Company.name } 
  end
end