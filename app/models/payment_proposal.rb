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

class PaymentProposal < ActiveRecord::Base
  validates :payment_date, presence: true
  validates :number, presence: true,
  					 uniqueness: true,
  					 case_sensitive: false
  validates :status, presence: true
  # need values for status enumeration
end
