# == Schema Information
#
# Table name: business_partner_accounts
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  activated           :boolean          default(FALSE)
#  bank_id             :integer
#  business_partner_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class BusinessPartnerAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :business_partner

  validates :number, presence: true,
             uniqueness: true,
             case_sensitive: false
end
