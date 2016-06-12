# == Schema Information
#
# Table name: company_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  currency   :integer          not null
#  company_id :integer
#  bank_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :company_account do
    number { Faker::Number.number(10) }
    currency { 1 } 
  end
end
