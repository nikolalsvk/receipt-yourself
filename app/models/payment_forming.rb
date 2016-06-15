# == Schema Information
#
# Table name: payment_formings
#
#  id                  :integer          not null, primary key
#  amount              :decimal(15, 4)   not null
#  company_account_id  :integer
#  input_invoice_id    :integer
#  payment_proposal_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PaymentForming < ActiveRecord::Base
  belongs_to :company_account
  belongs_to :input_invoice
  belongs_to :payment_proposal

  validates :amount, presence: true
end
