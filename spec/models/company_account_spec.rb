require 'rails_helper'

RSpec.describe CompanyAccount, type: :model do
  before do
    FactoryGirl.create(:company_account)
  end

  it { should validate_uniqueness_of(:number).case_insensitive }
  it { should validate_presence_of(:number) }

  it { should validate_presence_of(:currency) }
end
