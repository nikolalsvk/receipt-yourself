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

class BusinessPartner < ActiveRecord::Base
  validates :name, presence: true
  validates :type, presence: true

  # will enumerate type when know them
end
