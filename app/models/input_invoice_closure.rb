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
  validate :can_create_closure, on: :create
 
  def can_create_closure
    # if remaining amount of invoice is smaller than zero (can be zero)
    if (daily_statement.remaining_amount + input_invoice.remaining_amount) < 0
      errors.add(:closure_amount, "Cannot create Input Invoice Closure,
                                   amounts from Daily Statement and
                                   Input Invoice are not the same!")
    end
  end

  def revert_closure!
    self.transaction do
      input_invoice_remaining = input_invoice.remaining_amount - closure_amount
      input_invoice.update(remaining_amount: input_invoice_remaining,
                           circulation_date: nil)

      daily_statement_remaining = daily_statement.remaining_amount + closure_amount
      daily_statement.update(remaining_amount: daily_statement_remaining,
                             status: :processing)

      self.destroy
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
      self.closure_amount = daily_statement.transfer_amount
      current_remaining_amount = input_invoice.remaining_amount + self.closure_amount
      daily_statement.remaining_amount = 0
      input_invoice.update(remaining_amount: current_remaining_amount)
      daily_statement.update(status: :executed)
    end
  end
end
