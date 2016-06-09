# == Schema Information
#
# Table name: banks
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  contact_card_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :bank do
  	name { Faker::Company.name } 
  end
end
