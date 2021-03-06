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

require 'rails_helper'

RSpec.describe DailyStatement, type: :model do
  before do
    FactoryGirl.create(:daily_statement)
  end

  it { should validate_presence_of(:debtor_account_number) }
  it { should validate_length_of(:debtor_account_number).is_at_most(18)}
  it { should validate_presence_of(:debtor_account_name) }
  it { should validate_presence_of(:debtor_account_city) }
  it { should validate_presence_of(:debtor_model_number) }
  it { should validate_length_of(:debtor_model_number).is_at_most(2) }
  it { should validate_presence_of(:creditor_reference_number) }
  it { should validate_presence_of(:creditor_account_number) }
  it { should validate_length_of(:creditor_account_number).is_at_most(18) }
  it { should validate_presence_of(:approval_reference_number) }
  it { should validate_presence_of(:payment_number) }
  it { should validate_length_of(:payment_number).is_at_most(3) }
  it { should validate_presence_of(:payment_currency) }
  it { should validate_presence_of(:transfer_amount) }
  it { should validate_presence_of(:account_city) }
  it { should validate_presence_of(:currency_date) }
  it { should validate_presence_of(:payment_date) }
  it { should validate_presence_of(:calculation_method) }
  it { should validate_presence_of(:priority) }
  # it { should validate_presence_of(:status) }
  it { should validate_presence_of(:remaining_amount) }
end
