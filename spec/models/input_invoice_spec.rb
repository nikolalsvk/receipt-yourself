# == Schema Information
#
# Table name: input_invoices
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  payment_amount      :decimal(15, 4)   not null
#  remaining_amount    :decimal(15, 4)   not null
#  issuance_date       :datetime         not null
#  circulation_date    :datetime
#  payment_deadline    :datetime         not null
#  business_partner_id :integer
#  financial_year_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe InputInvoice, type: :model do
  before do
  	FactoryGirl.create(:input_invoice)
  end

 # it { should validate_presence_of(:number) }
 # it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:payment_amount) }
  it { should validate_presence_of(:remaining_amount) }
  it { should validate_presence_of(:issuance_date) }
  it { should validate_presence_of(:circulation_date) }
  it { should validate_presence_of(:payment_deadline) }
end
