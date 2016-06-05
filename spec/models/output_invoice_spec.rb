# == Schema Information
#
# Table name: output_invoices
#
#  id               :integer          not null, primary key
#  number           :integer
#  amount           :decimal(, )
#  remaining_amout  :decimal(, )
#  issuance_date    :datetime
#  circulation_date :datetime
#  payment_deadline :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe OutputInvoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
