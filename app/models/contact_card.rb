class ContactCard < ActiveRecord::Base
  validates :pib, presence: true, length: { minimum: 8}
  validates :country, presence: true
  validates :city, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end
