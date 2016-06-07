# == Schema Information
#
# Table name: output_invoice_closures
#
#  id             :integer          not null, primary key
#  closure_date   :datetime         not null
#  closure_amount :decimal(15, 4)   not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe OutputInvoiceClosure, type: :model do
  before do
  	FactoryGirl.create(:output_invoice_closure)
  end

  it { should validate_presence_of(:closure_date) }
  it { should validate_presence_of(:closure_amount) }
end
