class DailyBankStatement < ActiveRecord::Base
  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :statement_date, presence: true
end
