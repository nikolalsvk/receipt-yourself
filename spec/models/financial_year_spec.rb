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

require 'rails_helper'

RSpec.describe FinancialYear, type: :model do
  before do
  	FactoryGirl.create(:financial_year)
  end
  it { should validate_presence_of(:year) }
  it { should validate_length_of(:year).is_at_least(4) }
end
