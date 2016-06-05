# == Schema Information
#
# Table name: company_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  currency   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CompanyAccount, type: :model do
  before do
    FactoryGirl.create(:company_account)
  end

  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:number) }

  it { should validate_presence_of(:currency) }
end
