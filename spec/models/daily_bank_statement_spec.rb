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

require 'rails_helper'

RSpec.describe DailyBankStatement, type: :model do
  before do
    FactoryGirl.create(:daily_bank_statement)
  end	
  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:number) }

  it { should validate_presence_of(:statement_date)}
end
