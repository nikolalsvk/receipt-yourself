require 'rails_helper'

RSpec.describe ContactCard, type: :model do
  it { should validate_uniqueness_of(:pib) }
  it { should validate_presence_of(:pib) }
  it { should validate_length_of(:pib).is_at_least(8) }

  it { should validate_presence_of(:country) }

  it {should validate_presence_of(:city)}

  it { should validate_presence_of(:address) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:website) }

  it { should validate_presence_of(:phone) }


end
