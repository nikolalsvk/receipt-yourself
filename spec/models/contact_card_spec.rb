# == Schema Information
#
# Table name: contact_cards
#
#  id         :integer          not null, primary key
#  pib        :string           not null
#  country    :string           not null
#  region     :string
#  city       :string           not null
#  address    :string           not null
#  email      :string           not null
#  website    :string           not null
#  phone      :string           not null
#  fax        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ContactCard, type: :model do
  before do
    FactoryGirl.create(:contact_card)
  end
  it { should validate_uniqueness_of(:pib).case_insensitive }
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
