# == Schema Information
#
# Table name: input_invoices
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  payment_amount      :decimal(15, 4)   not null
#  remaining_amount    :decimal(15, 4)   not null
#  issuance_date       :datetime         not null
#  circulation_date    :datetime         not null
#  payment_deadline    :datetime         not null
#  business_partner_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class InputInvoice < ActiveRecord::Base
  belongs_to :business_partner

  validates :number, presence: true, 
                     uniqueness: true,
                     case_sensitive: false
  validates :payment_amount, presence: true
  validates :remaining_amount, presence: true
  validates :issuance_date, presence: true
  validates :circulation_date, presence: true
  validates :payment_deadline, presence: true
end
