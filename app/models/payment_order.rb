# == Schema Information
#
# Table name: payment_orders
#
#  id                        :integer          not null, primary key
#  debtor_account_number     :string(18)       not null
#  debtor_account_name       :string           not null
#  debtor_account_city       :string           not null
#  debtor_model_number       :string(2)        not null
#  debtor_reference_number   :string           not null
#  debtor_payment_purpose    :string           not null
#  creditor_model_number     :string(2)        not null
#  creditor_reference_number :string           not null
#  creditor_account_number   :string(18)       not null
#  payment_method            :integer          not null
#  approval_reference_number :string           not null
#  payment_number            :string(3)        not null
#  transfer_amount           :decimal(15, 4)   not null
#  currency_date             :datetime         not null
#  payment_date              :datetime         not null
#  account_city              :string           not null
#  payment_forming_id        :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class PaymentOrder < ActiveRecord::Base
  before_validation :set_amount, on: :create

  belongs_to :payment_forming

  validates :debtor_account_number, presence: true,
                                    length: { maximum: 18 }
  validates :debtor_account_name, presence: true
  validates :debtor_account_city, presence: true
  validates :debtor_model_number, presence: true,
                                  length: { maximum: 2 }
  validates :debtor_reference_number, presence: true
  validates :debtor_payment_purpose, presence: true

  # creditor validations
  validates :creditor_model_number, presence: true,
                                    length: { maximum: 2 }
  validates :creditor_reference_number, presence: true
  validates :creditor_account_number, presence: true,
                                      length: { maximum: 18 }

  # account stuff
  validates :approval_reference_number, presence: true
  validates :payment_number, presence: true,
                             length: { maximum: 3 }
  validates :payment_method, presence: true
  validates :transfer_amount, presence: true
  validates_numericality_of :transfer_amount, :greater_than => 0
  validates :account_city, presence: true
  validates :currency_date, presence: true
  validates :payment_date, presence: true

  # enumerations
  enum payment_method: Constants::Priority::PRIORITY_ARRAY

  private

  # Same as in payment_forming
  def set_amount
    self.transfer_amount = payment_forming.amount
  end
end
