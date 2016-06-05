# == Schema Information
#
# Table name: financial_years
#
#  id         :integer          not null, primary key
#  year       :integer
#  closed     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FinancialYear < ActiveRecord::Base
end
