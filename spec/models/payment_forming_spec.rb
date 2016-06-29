# == Schema Information
#
# Table name: payment_formings
#
#  id                  :integer          not null, primary key
#  amount              :decimal(15, 4)   not null
#  company_account_id  :integer
#  input_invoice_id    :integer
#  payment_proposal_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe PaymentForming, type: :model do
  before do
    FactoryGirl.create(:payment_forming)
  end

  #it { should validate_presence_of(:amount) }
end
