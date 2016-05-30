class ContactCard < ActiveRecord::Base
  validates :pib, presence: true,
  								unique: true,
  								length: { minimum: 8}
  validates :country, presence: true
  validates :city, presence: true
  validates :email, presence: true, unique: true
  validates :phone, presence: true
end
