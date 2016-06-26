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
  include ActiveModel::Serializers::JSON

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
  validates :transfer_amount, presence: true
  validates_numericality_of :transfer_amount, :greater_than => 0
  validates :account_city, presence: true
  validates :currency_date, presence: true
  validates :payment_date, presence: true

  validates :priority, presence: true
  validates :status, presence: true  
  validates :remaining_amount, presence: true
  validates_numericality_of :remaining_amount, :greater_than => 0

  #enumerations
  enum payment_currency: Constants::Currency::CURRENCY_HASH.keys
  enum calculation_method: [:bruto,
                            :neto]
  # there was no enumeration for priority in model
  #   but I think this is okay?
  enum priority: Constants::Priority::PRIORITY_ARRAY
  enum status: [:executed,                   # Izvršen nalog
                :not_executed_user_error,    # Neizvršen zbog nelikvidnosti podračuna korisnika
                :not_executed_carrier_error, # Neizvršen zbog nelikvidnosti računa nosioca u NBJ
                :unauthorized,               # Nalog nije odobren za izvršenje- neviziran nalog
                :wrong,                      # Pogrešan nalog
                :stopped]                    # Nalog stopiran za izvršenje

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end
