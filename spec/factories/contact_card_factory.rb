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

FactoryGirl.define do
  factory :contact_card do
    pib { Faker::Number.number(8) }
    country { Faker::Address.country }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
    website { Faker::Internet.url }
    phone { Faker::PhoneNumber.phone_number } 
  end
end
