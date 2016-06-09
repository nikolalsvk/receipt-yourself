# == Schema Information
#
# Table name: banks
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  contact_card_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Bank < ActiveRecord::Base
  belongs_to :contact_card
  has_many :business_partner_accounts

  validates :name, presence: true, uniqueness: true
end
