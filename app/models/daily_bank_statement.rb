# == Schema Information
#
# Table name: daily_bank_statements
#
#  id                 :integer          not null, primary key
#  number             :string           not null
#  statement_date     :datetime         not null
#  previous_amount    :decimal(15, 4)
#  new_amout          :decimal(15, 4)
#  reserved_amount    :decimal(15, 4)
#  total_payment      :decimal(15, 4)
#  total_payout       :decimal(15, 4)
#  company_account_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DailyBankStatement < ActiveRecord::Base
  belongs_to :company_account

  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :statement_date, presence: true
end
