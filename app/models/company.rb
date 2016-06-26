# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  contact_card_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :company_accounts, dependent: :destroy
  has_many :financial_years, dependent: :destroy
  has_many :output_invoices, dependent: :destroy
  belongs_to :contact_card

  validates :name, presence: true, uniqueness: true
end
