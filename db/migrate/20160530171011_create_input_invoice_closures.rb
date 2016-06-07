class CreateInputInvoiceClosures < ActiveRecord::Migration
  def change
    create_table :input_invoice_closures do |t|
      t.datetime :closure_date, null: false
      t.decimal :closure_amount, null: false, precision: 15, scale: 4

      t.timestamps null: false
    end
  end
end
