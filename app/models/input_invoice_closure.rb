# == Schema Information
#
# Table name: input_invoice_closures
#
#  id                 :integer          not null, primary key
#  closure_date       :datetime         not null
#  closure_amount     :decimal(15, 4)   not null
#  daily_statement_id :integer
#  input_invoice_id   :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InputInvoiceClosure < ActiveRecord::Base
  before_validation :set_closure_date, on: :create
  before_validation :set_closure_amount, on: :create

  belongs_to :daily_statement
  belongs_to :input_invoice

  validates :closure_date, presence: true
  validates :closure_amount, presence: true

  # custom validations here pls
  validate :can_close_invoice, on: :create
 
  def can_close_invoice
    unless (input_invoice.payment_amount == daily_statement.transfer_amount) &&
           ((input_invoice.remaining_amount + input_invoice.payment_amount) == daily_statement.remaining_amount)
      errors.add(:closure_amount, "Cannot create Input Invoice Closure,
                                   amounts from Daily Statement and
                                   Input Invoice are not the same!")
    end
  end

  private

  # trying to set circulation date
  #   to be the same as closure date
  def set_closure_date
    self.transaction do
      self.closure_date = Date.today
      input_invoice.update(circulation_date: Date.today)
    end
  end


  def set_closure_amount
    self.transaction do
      self.closure_amount = input_invoice.payment_amount
      current_remaining_amount = input_invoice.remaining_amount - input_invoice.payment_amount
      # should the same be done with daily_statement?
      input_invoice.update(remaining_amount: current_remaining_amount)
      # how and when do i set other statuses?
      #   we will probably set status wrong
      #   or somethind ig closing fail?
      daily_statement.update(status: :executed)
    end
  end
end
