class BusinessPartnerAccount < ActiveRecord::Base
  validates :number, presence: true,
  					 uniqueness: true,
  					 case_sensitive: false
end
