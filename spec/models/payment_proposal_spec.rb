# == Schema Information
#
# Table name: payment_proposals
#
#  id           :integer          not null, primary key
#  payment_date :datetime         not null
#  number       :string           not null
#  status       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe PaymentProposal, type: :model do
  before do
    FactoryGirl.create(:payment_proposal)
  end

  it { should validate_presence_of(:payment_date) }
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:status) }
end
