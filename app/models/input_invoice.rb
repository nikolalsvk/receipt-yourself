# == Schema Information
#
# Table name: input_invoices
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  payment_amount      :decimal(15, 4)   not null
#  remaining_amount    :decimal(15, 4)   not null
#  issuance_date       :datetime         not null
#  circulation_date    :datetime
#  payment_deadline    :datetime         not null
#  business_partner_id :integer
#  financial_year_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class InputInvoice < ActiveRecord::Base
  belongs_to :business_partner
  belongs_to :financial_year
  has_many :input_invoice_closures, dependent: :destroy
  has_many :payment_formings, dependent: :destroy

  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :payment_amount, presence: true
  validates :remaining_amount, presence: true
  validates :issuance_date, presence: true
  validates :payment_deadline, presence: true

  def as_json(options = {})
    super(options.merge(:include => [:business_partner,
                                     :financial_year]))
  end

end
