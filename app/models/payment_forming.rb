# == Schema Information
#
# Table name: payment_formings
#
#  id                 :integer          not null, primary key
#  amount             :decimal(15, 4)   not null
#  company_account_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PaymentForming < ActiveRecord::Base
  belongs_to :company_account
  belongs_to :input_invoice

  validates :amount, presence: true
end
