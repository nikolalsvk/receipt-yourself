# == Schema Information
#
# Table name: financial_years
#
#  id         :integer          not null, primary key
#  year       :string           not null
#  closed     :boolean          default(FALSE)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :financial_year do
  	year { Faker::Number.number(4) } 
  end
end
