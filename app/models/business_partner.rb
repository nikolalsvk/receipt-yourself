# == Schema Information
#
# Table name: business_partners
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  type            :integer          not null
#  contact_card_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class BusinessPartner < ActiveRecord::Base
  belongs_to :contact_card
  has_many :input_invoices
  has_many :business_partner_accounts
  has_many :output_invoices
  has_many :daily_statements

  validates :name, presence: true
  validates :type, presence: true

  # will enumerate type when know them
end
