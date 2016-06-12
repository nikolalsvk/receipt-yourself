# == Schema Information
#
# Table name: output_invoices
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  payment_amount      :decimal(15, 4)   not null
#  remaining_amount    :decimal(15, 4)   not null
#  issuance_date       :datetime         not null
#  circulation_date    :datetime         not null
#  payment_deadline    :datetime         not null
#  company_id          :integer
#  business_partner_id :integer
#  financial_year_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :output_invoice do
    number { Faker::Number.number(12) }
    payment_amount { Faker::Number.decimal(11, 4) }
    remaining_amount { Faker::Number.decimal(11, 4) }
    issuance_date { Date.today }
    circulation_date { Date.today }
    payment_deadline { Date.today }
  end
end
