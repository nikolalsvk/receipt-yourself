# == Schema Information
#
# Table name: input_invoice_closures
#
#  id             :integer          not null, primary key
#  closure_date   :datetime
#  closure_amount :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe InputInvoiceClosure, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
