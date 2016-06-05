# == Schema Information
#
# Table name: input_invoices
#
#  id               :integer          not null, primary key
#  number           :integer
#  payment_amount   :decimal(, )
#  remaining_amount :decimal(, )
#  issuance_date    :datetime
#  circulation_date :datetime
#  payment_deadline :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe InputInvoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
