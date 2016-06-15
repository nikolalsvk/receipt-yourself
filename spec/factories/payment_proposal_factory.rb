
# == Schema Information
#
# Table name: payment_proposals
#
#  id           :integer          not null, primary key
#  payment_date :datetime         not null
#  number       :string           not null
#  status       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryGirl.define do
  factory :payment_proposal do
    payment_date { Date.today }
    number { Faker::Number.number(6) }
    status { 1 }
  end
end
