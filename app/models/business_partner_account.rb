# == Schema Information
#
# Table name: business_partner_accounts
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  activated  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BusinessPartnerAccount < ActiveRecord::Base
  validates :number, presence: true,
  					 uniqueness: true,
  					 case_sensitive: false
end
