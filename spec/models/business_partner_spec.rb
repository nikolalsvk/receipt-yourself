require 'rails_helper'

RSpec.describe BusinessPartner, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:type) }
end
