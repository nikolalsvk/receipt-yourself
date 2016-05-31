require 'rails_helper'

RSpec.describe BusinessPartnerAccount, type: :model do
  before do
    FactoryGirl.create(:business_partner_account)
  end

  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:number) }
end
