class CompanyAccount < ActiveRecord::Base
  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :currency, presence: true
  enum currency: CURRENCY_HASH.keys
end
