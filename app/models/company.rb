# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
	has_many :users
	has_many :company_accounts
	has_many :financial_years

	validates :name, presence: true, uniqueness: true
end
