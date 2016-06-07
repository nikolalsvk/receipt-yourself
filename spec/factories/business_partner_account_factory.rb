# == Schema Information
#
# Table name: business_partner_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  activated  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :business_partner_account do
  	number { Faker::Number.number(10) } 
  	activated false
  end
end
