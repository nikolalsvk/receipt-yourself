# == Schema Information
#
# Table name: financial_years
#
#  id         :integer          not null, primary key
#  year       :string           not null
#  closed     :boolean          default(FALSE)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FinancialYear < ActiveRecord::Base
  belongs_to :company

  validates :year, presence: true,
                   length: { minimum: 4,
                             maximum: 4 }
end
