# == Schema Information
#
# Table name: business_partner_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  activated  :boolean          default(FALSE)
#  bank_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessPartnerAccount, type: :model do
  before do
    FactoryGirl.create(:business_partner_account)
  end

  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:number) }
end
