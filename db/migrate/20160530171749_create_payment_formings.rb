class CreatePaymentFormings < ActiveRecord::Migration
  def change
    create_table :payment_formings do |t|
      t.decimal :amount, null: false, precision: 15, scale: 4

      t.belongs_to :company_account, index: true
      t.belongs_to :input_invoice, index: true

      t.timestamps null: false
    end
  end
end
