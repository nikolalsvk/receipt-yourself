# == Schema Information
#
# Table name: daily_statements
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
#  approval_reference_number :string           not null
#  payment_number            :string(3)        not null
#  payment_currency          :integer          not null
#  transfer_amount           :decimal(15, 4)   not null
#  account_city              :string           not null
#  currency_date             :datetime         not null
#  payment_date              :datetime         not null
#  calculation_method        :integer          not null
#  priority                  :integer          not null
#  status                    :integer          not null
#  remaining_amount          :decimal(15, 4)   not null
#  business_partner_id       :integer
#  daily_bank_statement_id   :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class DailyStatement < ActiveRecord::Base
  belongs_to :business_partner
  belongs_to :daily_bank_statement
  has_many :input_invoice_closures
  has_many :output_invoice_closures
  
  # debtor validations
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
  validates :payment_currency, presence: true
  enum payment_currency: CURRENCY_HASH.keys
  validates :transfer_amount, presence: true
  validates_numericality_of :transfer_amount, :greater_than => 0
  validates :account_city, presence: true
  validates :currency_date, presence: true
  validates :payment_date, presence: true
  validates :calculation_method, presence: true
  # need values for eumerating calculation method
  validates :priority, presence: true
  # need values for enumerating priority
  validates :status, presence: true
  # need values for enumerating status
  validates :remaining_amount, presence: true
  validates_numericality_of :remaining_amount, :greater_than => 0
end
