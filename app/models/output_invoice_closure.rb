# == Schema Information
#
# Table name: output_invoice_closures
#
#  id                 :integer          not null, primary key
#  closure_date       :datetime         not null
#  closure_amount     :decimal(15, 4)   not null
#  daily_statement_id :integer
#  output_invoice_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class OutputInvoiceClosure < ActiveRecord::Base
  belongs_to :daily_statement
  belongs_to :output_invoice

  validates :closure_date, presence: true
  validates :closure_amount, presence: true
end
