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
