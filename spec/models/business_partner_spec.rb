# == Schema Information
#
# Table name: business_partners
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  type       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessPartner, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:type) }
end
