require 'rails_helper'

RSpec.describe Bank, type: :model do
  before do
    FactoryGirl.create(:bank)
  end

  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
end
