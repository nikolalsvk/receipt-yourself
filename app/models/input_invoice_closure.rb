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

class InputInvoiceClosure < ActiveRecord::Base
end
