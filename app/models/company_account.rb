# == Schema Information
#
# Table name: company_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  currency   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CompanyAccount < ActiveRecord::Base
  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :currency, presence: true
  enum currency: CURRENCY_HASH.keys
end
