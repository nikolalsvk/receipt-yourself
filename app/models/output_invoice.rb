# == Schema Information
#
# Table name: output_invoices
#
#  id                  :integer          not null, primary key
#  number              :string           not null
#  payment_amount      :decimal(15, 4)   not null
#  remaining_amount    :decimal(15, 4)   not null
#  issuance_date       :datetime         not null
#  circulation_date    :datetime
#  payment_deadline    :datetime         not null
#  company_id          :integer
#  business_partner_id :integer
#  financial_year_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class OutputInvoice < ActiveRecord::Base
  belongs_to :company
  belongs_to :business_partner
  belongs_to :financial_year
  has_many :output_invoice_closures, dependent: :destroy

  validates :number, presence: true,
                     uniqueness: true,
                     case_sensitive: false
  validates :payment_amount, presence: true
  validates :remaining_amount, presence: true
  validates :issuance_date, presence: true
  validates :payment_deadline, presence: true

  scope :closed, -> { includes(:output_invoice_closures).where(:output_invoice_closures => { :id => nil }) }
  scope :opened, -> { joins(:output_invoice_closures).group("output_invoices.id").having("count(output_invoice_id) > 0") }

  def as_json(options = {})
    super(options.merge(:include => [:business_partner,
                                     :financial_year => {
                                       :include => :company
                                     }
          ]))
  end
end
