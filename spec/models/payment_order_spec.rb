# == Schema Information
#
# Table name: payment_orders
#
#  id                        :integer          not null, primary key
#  creditor_account_number   :integer
#  account_name              :string
#  account_city              :string
#  payment_method            :integer
#  debtor_model_number       :integer
#  debtor_reference_number   :string
#  debtor_payment_purpose    :string
#  approval_reference_number :string
#  payment_number            :integer
#  payment_currency          :string
#  transfer_amount           :decimal(, )
#  currency_date             :datetime
#  payment_date              :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'rails_helper'

RSpec.describe PaymentOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
