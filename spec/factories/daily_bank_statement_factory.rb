FactoryGirl.define do
  factory :daily_bank_statement do
  	number { Faker::Number.number(10) } 
  	statement_date { DateTime.now }
    previous_amount { Faker::Number.decimal(2, 4) }
    new_amout { Faker::Number.decimal(2, 4) }
    reserved_amount { Faker::Number.decimal(2, 4) }
    total_payment { Faker::Number.decimal(2, 4) }
    total_payout { Faker::Number.decimal(2, 4) }
  end
end