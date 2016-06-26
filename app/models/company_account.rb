# == Schema Information
#
# Table name: company_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  currency   :integer          not null
#  company_id :integer
#  bank_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CompanyAccount < ActiveRecord::Base
  belongs_to :company
  belongs_to :bank
  has_many :payment_formings, dependent: :destroy
  has_many :daily_bank_statements, dependent: :destroy

  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :currency, presence: true
  enum currency: Constants::Currency::CURRENCY_HASH.keys
end
