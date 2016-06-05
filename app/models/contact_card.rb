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

class ContactCard < ActiveRecord::Base
  validates :pib, presence: true,
                  uniqueness: true,
                  numericality: true,
                  length: { minimum: 8 },
                  case_sensitive: false
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :website, presence: true
  validates :phone, presence: true
end
