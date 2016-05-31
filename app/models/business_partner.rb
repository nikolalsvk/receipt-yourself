class BusinessPartner < ActiveRecord::Base
  validates :name, presence: true
  validates :type, presence: true

  # will enumerate type when know them
end
