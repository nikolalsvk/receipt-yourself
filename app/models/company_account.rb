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

  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :currency, presence: true
  enum currency: CURRENCY_HASH.keys
end
