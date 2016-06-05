# == Schema Information
#
# Table name: daily_statements
#
#  id                        :integer          not null, primary key
#  debtor_account_number     :integer
#  debtor_account_name       :string
#  debtor_account_city       :string
#  debtor_model_number       :integer
#  debtor_reference_number   :string
#  debtor_payment_purpose    :string
#  creditor_model_number     :integer
#  creditor_reference_number :string
#  creditor_account_number   :integer
#  approval_reference_number :string
#  payment_number            :integer
#  payment_currency          :string
#  transfer_amount           :decimal(, )
#  account_city              :string
#  currency_date             :datetime
#  payment_date              :datetime
#  calculation_method        :integer
#  priority                  :integer
#  status                    :integer
#  remaining_amount          :decimal(, )
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'rails_helper'

RSpec.describe DailyStatement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
