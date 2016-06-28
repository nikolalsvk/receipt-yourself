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
  before_validation :set_amount, on: :create

  belongs_to :company_account
  belongs_to :input_invoice
  belongs_to :payment_proposal

  # I guess that one payment_forming
  #   can have one payment_order?
  has_one :payment_order

  validates :amount, presence: true

  private

  # when looking at the model
  #   it seems to me that this amout is the
  #   same amount as payment_amount in 
  #   input invoice, hope that this is okay
  def set_amount
    self.amount = input_invoice.payment_amount
  end
end
