# == Schema Information
#
# Table name: output_invoice_closures
#
#  id                 :integer          not null, primary key
#  closure_date       :datetime         not null
#  closure_amount     :decimal(15, 4)   not null
#  daily_statement_id :integer
#  output_invoice_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :output_invoice_closure do
  	closure_date { Date.today }
  	closure_amount { Faker::Number.decimal(10, 4) } 
  end
end
