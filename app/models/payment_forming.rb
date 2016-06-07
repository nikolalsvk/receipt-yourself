# == Schema Information
#
# Table name: payment_formings
#
#  id         :integer          not null, primary key
#  amount     :decimal(15, 4)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentForming < ActiveRecord::Base
  validates :amount, presence: true
end
