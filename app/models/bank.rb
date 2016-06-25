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
  include ActiveModel::Serializers::JSON

  belongs_to :contact_card
  has_many :business_partner_accounts
  has_many :company_accounts

  validates :name, presence: true, uniqueness: true

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end

end
