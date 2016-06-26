# == Schema Information
#
# Table name: business_partners
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  contact_card_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category        :integer          not null
#

class BusinessPartner < ActiveRecord::Base
  belongs_to :contact_card
  has_many :input_invoices
  has_many :business_partner_accounts
  has_many :output_invoices
  has_many :daily_statements

  validates :name, presence: true
  validates :category, presence: true
  enum category: [ :buyer, :supplier, :buyer_and_supplier ]
end
