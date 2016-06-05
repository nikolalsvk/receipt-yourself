# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    FactoryGirl.create(:company)
  end

  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
end
