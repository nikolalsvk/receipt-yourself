# == Schema Information
#
# Table name: daily_bank_statements
#
#  id              :integer          not null, primary key
#  number          :string           not null
#  statement_date  :datetime         not null
#  previous_amount :decimal(15, 4)
#  new_amout       :decimal(15, 4)
#  reserved_amount :decimal(15, 4)
#  total_payment   :decimal(15, 4)
#  total_payout    :decimal(15, 4)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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
